import 'package:flutter/material.dart';
import 'main.dart';
import 'productlist.dart';
import 'productview.dart';
import 'Cart.dart';
import 'myorders.dart';
import 'location.dart';
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'grouphome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'model/discount.dart';
import 'model/youtubemodel.dart';

// import 'package:provider/provider.dart';
// import 'states.dart';
import 'productlist.dart';
import 'wallet.dart';
import 'search.dart';
import 'testing.dart';
import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
final List<String> imgList = [
  'http://www.lingandsons.com/readBlob.do?id=5431',
  'https://5210.psu.edu/wp-content/uploads/2018/05/food-fruits-veggies-shopping.jpg',
  'https://foodrevolution.org/wp-content/uploads/2017/12/blog-featured-eat_the_rainbow_oranges-20171207.png',
  // 'https://images.jdmagicbox.com/comp/vijayawada/h6/0866px866.x866.170113004303.u4h6/catalogue/v-mart-siddhartha-nagar-vijayawada-grocery-stores-c7v48.jpg',
  // 'https://breastcancer-news.com/wp-content/uploads/2018/07/shutterstock_793959790_zpsny04h5b8-1024x480.jpg'
  
   ];
   
   final List<String> tyt = [


  'http://www.lingandsons.com/readBlob.do?id=5431'
    //  {image:'http://www.lingandsons.com/readBlob.do?id=5431',link:'http://www.lingandsons.com/readBlob.do?id=5431',
    //  title:'http://www.lingandsons.com/readBlob.do?id=5431',
    //  ch_name:'http://www.lingandsons.com/readBlob.do?id=5431'}



//  { 
//   "name": "ghg",
//   "price": "ghg",
//   "description": "ghg",
//   "discount_amount": "ghg",
//     "discount_percent":"ghg",
  
//   "unit": "json['unit']",
//   "img_url": "json['img_url']",
//   "on_move": "json['on_move']",
//   "vendor_id":" json['vendor_id']",
//   "product_id": "json['product_id']",
//  }
  ];
// class AppHome extends StatefulWidget {

//   @override
//   _AppHomeState createState() => new _AppHomeState();
// }

// class _AppHomeState extends State<AppHome> with SingleTickerProviderStateMixin{


class AppHome extends StatefulWidget {



  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {


var myname= "",pincode="",area="",mobile="",token="",myid="";

var loading=true;
var discount_list;
int discount_inc =0;

var discount_time =[];
var discount_time_diff =[];
var base_url = "";
var cart_qty ;
var payment ;
// List<DiscountModel> discount = new List();
 Response response;
// List cart = new List();
// List<YoutubeModel> listOMaps;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override



void TimeCounter(){

  Timer.periodic(Duration(seconds: 1), (timer) {

for(int i = 0;i<discount_time.length;i++){

  var date = new DateTime.now();

var diff  = discount_time[i].difference(date);

setState(() {
discount_time_diff[i]=diff;
  
});


}






  // print(date.difference( discount_time[1]));



});

}








void HomeData(base_url) async {
  setState(() {
 loading=true;
});
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
 
 
     response = await dio.post(base_url+"api/home_screen",
     
     data: {
       "customer_id":myid,
        "pincode":pincode,
        "area":area
    
    }
    ,options: Options(headers: {"Authorization": token})
    );
    print(response.data["cart"]);
    



    if(response.data["status"])
    {
 model.SetCartQty(response.data["cart"].length) ;


 model.SetCart(response.data["cart"] as List);



for(int i = 0;i<response.data["discount"].length;i++){

  var date = new DateTime.now();

discount_time.add(new DateTime(date.year, date.month, date.day+1, date.hour+i+1,  date.minute,  date.second));


// var diff  = date.difference(new DateTime(date.year, date.month, date.day, date.hour+i+1,  date.minute,  date.second));
discount_time_diff.add("00:00:00");

if(i == response.data["discount"].length-1){

TimeCounter();



}

}






     
   
setState(() {
 loading=false;
});

   }

    else{
 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("OOPS something wrong."),
          content: new Text("Please Try again"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
      
setState(() {
     loading=false; 
     
    });
    }
    
  } catch (e) {
    //print(e);
  }
}










getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
    // //print("token " +prefs.getString("token"));
    // //print("myid "+prefs.getString("myid"));
    // //print("myname "+prefs.getString("myname"));
    // //print("mobile "+prefs.getString("mobile"));
    // //print("pincode "+prefs.getString("pincode"));
    // //print("area "+prefs.getString("area"));
CounterModel model = ScopedModel.of(context);
 

 setState(() {
  myname =  prefs.getString("myname");
  pincode=prefs.getString("pincode");
  area=prefs.getString("area");
  mobile=prefs.getString("mobile");
  token=prefs.getString("token");
  myid=prefs.getString("myid") ;
 base_url = model.url; 

 });
HomeData(model.url);

//print(myid);
model.setMyid(myid);
model.setArea(area);
model.setPincode(pincode);
model.setToken(token);
  }

  @override
 
  void initState() {

    getSharedPreferences();
    super.initState();
  }




_saveValues(io) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("islogin",io);
                Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new HomePage()));

}


void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Do you want to Logout?"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("LOGOUT"),
              onPressed: () {
                Navigator.of(context).pop();
_saveValues(null);

              },
            ), new FlatButton(
              child: new Text("CANCEL"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context){
CounterModel model = ScopedModel.of(context);

        // final counter = Provider.of<States>(context);

    return new Scaffold(

 key: _scaffoldKey,

 
      appBar: new AppBar(
        
        
        title:
        //  search? new TextField(
        //   // controller: _filter,
        //   style: new TextStyle(color: Colors.white,fontSize: 18),
        //   decoration: new InputDecoration(
           
        //     hintText: 'Search...',
        //     fillColor: Colors.white,
        //     hintStyle: TextStyle(color: Colors.white70),
        //      focusedBorder: UnderlineInputBorder( 
                    
        //               borderSide: BorderSide(color: Colors.red[400]),   
        //               ),    
        //   ),

          
        // ):

        Text("Shopright"),
        
//         GestureDetector(
// child:     Container(
//           width: 100,
//           height: 45,
// decoration: BoxDecoration(

//   // color: Colors.red,
//   border: Border.all(width: 0.5,color: Colors.grey),
  
// ),
//           child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[

//               Text("My Location",style: new TextStyle(fontSize: 10),),

//               Text("636451",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
//               Text("mecheri",style: new TextStyle(fontSize: 10),),
//             ],
//           )
//         ),

// onTap: ()=>//print('cdfg'),

//         ),
        
        
     



       actions: <Widget>[
        //  search? new IconButton(icon: new Icon(Icons.close),
        //       onPressed: (){

        //         setState(() {
        //          search=false; 
        //         });
        //       },
        //       ):
        new IconButton(icon: new Icon(Icons.search),
              onPressed: (){

                // setState(() {
                //  search=true; 
                // });

                  // SearchView().showMaterialSearch(context);
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SearchView()));

              },
              ),

 new Padding(
                padding: EdgeInsets.only(top: 5.0,right: 5),
                child: new Stack(
                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.shopping_cart),
                      onPressed: () {
                        _scaffoldKey.currentState.openEndDrawer();

                        //print(discount_time);
                        //print(discount_time_diff);
                      },
                    ),
                  
          new Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: new Icon(Icons.brightness_1, size: 22.0, 
                        color: Colors.redAccent),
                    ) ,

 ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return

                    new Positioned(
                      
                     top: 6.0,
                      right:  model.cart.length >= 10? 6.0:7.0,
                      
                      // child: new Text(counter.getCart().toString(),
                      
                      // textAlign: TextAlign.center,
                      
                      //   style: new TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 12.0,
                      //     fontWeight: FontWeight.w600,
                          
                      //   )


                      child:Text(
                  model.cart.length.toString(),
                  
                  textAlign: TextAlign.center,
                      
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          
                        )
                ),
             
                      // ),
                    );
                   },
            ),
                  ],
                ),
              ),


        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          )
        ),
     
      ),

 endDrawer: new Drawer(
   elevation: 50,
            child: new CartView(),
            // width: MediaQuery.of(context).size.width * 0.55,
          ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
             

 accountName: Text(myname,style: new TextStyle(fontSize: 25),),
                    accountEmail: Text(mobile),
                   
                    decoration: BoxDecoration( image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new ExactAssetImage('assets/menu_back.jpg'),
                )),




            
            ),










            new ListTile(
              leading: Icon(Icons.home,color:Colors.orange[800]),
              title: new Text("Home",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();
              //  counter.stateSet(0);


                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),


            new ListTile(
              leading: Icon(Icons.shopping_cart,color:Colors.green),
              title: new Text("My Cart",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();

                        _scaffoldKey.currentState.openEndDrawer();

                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),
            


            new ListTile(
              leading: Icon(Icons.shopping_basket,color:Colors.yellow[800]),
              title: new Text("My Orders",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();
              //  counter.stateSet(3);
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyOrders()));
              }
            ),

            


            new ListTile(
              leading: Icon(Icons.favorite,color: Colors.pink,),
              title: new Text("Wishlist",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
              //  counter.dropdownSet(4);

                Navigator.of(context).pop();
model.setProductlist(96);

                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));

                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),

new ListTile(
              leading: Icon(Icons.assignment,color: Colors.deepPurple,),
              title: new Text("Group Order",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new GroupHome()));
              }
            ),


new ListTile(
              leading: Icon(Icons.attach_money,color:Colors.deepPurple),
              title: new Text("My Wallet",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Wallet()));
              }
            ),

new ListTile(
              leading: Icon(Icons.language,color:Colors.blue),
              title: new Text("Language",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();


                 return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Language',textAlign: TextAlign.center,style: new TextStyle(fontSize: 25),),
            content: Container(


              height: 100,
              child:   RadioButtonGroup(
  labels: <String>[
    "English",
    " தமிழ் (Tamil)",
  ],
  picked: "Option 2",
  // onSelected: (String selected) => //print(selected)
),
           
            ),
            
          //  actions: <Widget>[
          //     new FlatButton(
          //       child: new Text('CANCEL'),
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //     )
          //   ],
          );
        });
                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),
new ListTile(
              leading: Icon(Icons.arrow_back,color: Colors.red,),
              title: new Text("Logout",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();
               
               _showDialog(context);
               
               
                }
            ),

new Padding(padding: EdgeInsets.only(bottom: 20),)








          ],

        
        ),
      ),




  
body:

//  loading?SpinKitThreeBounce(
//   color: Colors.pink,
//   size: 50.0,
  
// ):

     new ListView(


          children: <Widget>[


//             new Row(
// mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[

// new Row(children: <Widget>[
//  Icon(Icons.place,size: 20,
//  color: Colors.orange[600],),
// Padding(padding: EdgeInsets.all(1),),
//             Text(pincode,style: new TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),)
         
//             ,Text(' - '+area, overflow: TextOverflow.ellipsis,
//     maxLines: 1,style: new TextStyle(color: Colors.brown),),


// ],),



// Padding(padding: EdgeInsets.only(right: 20)),

//     ButtonTheme(
           
//   minWidth: 40.0,
//   height: 30.0,
//   buttonColor: Colors.pinkAccent,
//           child:
          
//        FlatButton(


//          onPressed: (){//print('Change Location');
      

//                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Location()));

//         //  HomeData(base_url);
//         // test();
//          },

//          child: Text('Change Location',style: new TextStyle(color:Colors.blue),),
//        ),

//           ),
//               ],
//             ),





Padding(padding: EdgeInsets.all(5),),

              CarouselSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      
      enlargeCenterPage: true,
      items:
       imgList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    ),


Padding(padding: EdgeInsets.only(top:15,left: 10,right: 10,bottom: 3),
 child: new Divider(color: Colors.black,),
),

Align(

 alignment: Alignment.center,

  child:new Text("Shop by Catogry",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Color(0xff0a0047),),)
),

Padding(padding: EdgeInsets.only(bottom: 15),),
new Row(

mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: <Widget>[


GestureDetector(
               
                onTap: (){
model.setProductlist(0);

                   Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
 },
  child:  Card(
color: Color(0xfff7fcf9),
  elevation: 10,
child: new Padding(
padding: EdgeInsets.all(15),
child: new Column(
children: <Widget>[
Image.asset(
        'assets/vegetables.png',
        height: 60.0,
        width: 60.0,
        alignment: Alignment.center,
      ),
   Padding(
padding: EdgeInsets.only(top:15),
        child: new Text('Vegetable',style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xff012811)),),
      )
],)),), 
),



GestureDetector(
                onTap: (){ 

              model.setProductlist(2);
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
 },
  child:  Card(
color: Color(0xfff7fcf9),
  elevation: 10,
child: new Padding(
padding: EdgeInsets.all(15),
child: new Column(
children: <Widget>[
Image.asset(
        'assets/fruits.png',
        height: 60.0,
        width: 60.0,
        alignment: Alignment.center,
      ),
   Padding(
padding: EdgeInsets.only(top:15),
        child: new Text('Fruits',style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xff012811)),),
      )
],)),), 
),


GestureDetector(
                onTap: (){ 
getSharedPreferences();
                  // //print(model.cart.length.toString());
                  // model.setProductlist(1);
                  // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
 
 
 
 },
  child:  Card(

    
color: Color(0xfff7fcf9),

  elevation: 10,
child: new Padding(
padding: EdgeInsets.all(15),
child: new Column(
children: <Widget>[
Image.asset(
        'assets/grocery.png',
        height: 60.0,
        width: 60.0,
        alignment: Alignment.center,
      ),

      Padding(
padding: EdgeInsets.only(top:15),
        child: new Text('Grocery',style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:  Color(0xff012811),),),
      )

],)),), 
),


],


),



  
Padding(padding: EdgeInsets.only(top:15,left: 10,right: 10,bottom: 3),
 child: new Divider(color: Colors.black,),
),



Align(

 alignment: Alignment.center,

  child:new Text("Discount Offer",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Color(0xff0a0047),),)
),

Padding(padding: EdgeInsets.only(bottom: 15),),

Container(
  // height: 359,
  child:    loading?SpinKitThreeBounce(
  color: Colors.pink,
  size: 50.0,
  
):response.data["discount"].length<=0?Text("No Offer",textAlign: TextAlign.center,): CarouselSlider(
    height: 270,
  
      viewportFraction: 0.65,
      aspectRatio: 2.0,
      // autoPlay: true,
      // enableInfiniteScroll: false,
      enableInfiniteScroll:response.data["discount"].length==1? false:true,

      enlargeCenterPage: true,
      
      items:

   
      
      ( response.data["discount"] as List).map(
        (data) {
        
        // discount_inc++;
        // //print(data);
          return 
            
new GestureDetector(

  child:
                new Card(
             
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                
              ),
             color: Color(0xffedf3ff),
            child: Container(
            width: 200,

            decoration: BoxDecoration(

    border: new Border.all(color: Colors.black87,),
                borderRadius: BorderRadius.circular(22.0),


            ),
child:Column(
              children: <Widget>[


// Padding(padding: EdgeInsets.only(left:50,right: 50),),



                Row(

mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
new Container(
  margin: const EdgeInsets.all(15.0),
  padding: const EdgeInsets.all(3.0),
  decoration: new BoxDecoration(
    color: Colors.lightGreen[100],
    border: new Border.all(color: Colors.pink,),
    borderRadius:new BorderRadius.all(Radius.circular(20.0)) ,
  ),
  child: new Text(" "+data["discount_percent"].toString()+" off " ,style: new TextStyle(),),
),


Padding(padding: EdgeInsets.only(right:10),

child:

// Timer.periodic(Duration(seconds: 5), (timer) {
//   //print(DateTime.now());

//   return 
// }),

new Text(discount_time_diff[response.data["discount"].indexOf(data)].toString().substring(0,8),style: new TextStyle(),)

 ),


                    
                  ],
                ),

                




          new ClipRRect(
    borderRadius: new BorderRadius.circular(15.0),
    child:Image.network(data["img_url"],
            // fit: BoxFit.fill,
            height: 120,
            width: 120,
         
          
          ),
),

Padding(padding: EdgeInsets.all(5),),

    new Text(data["name"],style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.brown),),
         
Padding(padding: EdgeInsets.all(5),),

Row(



mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: <Widget>[




    new Text(data["price"].toString(),style: new TextStyle(fontSize: 18,),),
    new Text(data["unit"].toString(),style: new TextStyle(fontSize: 18,color: Colors.grey),),



  ],
),


              
              ],

),
            ),
            ),


            onTap: (){


              //print(data["name"]);
            },
          );
       
      
      
        },
      
      
      ).toList(),
    
    
    
    ),
),
 
Padding(padding: EdgeInsets.all(5),),
loading?Padding(padding: EdgeInsets.all(1)):response.data["discount"].length<=0?Padding(padding: EdgeInsets.all(1),): Padding(
padding: EdgeInsets.only(right:10),
child:Align(


  alignment: Alignment.center,

  child: 
 new RaisedButton(color: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),), padding: EdgeInsets.all(15),
                      onPressed: (){
model.setProductlist(97);

                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
                     
                      },
                      child: new Text("     View More     ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
                  ),
), 


 ),
  






Padding(padding: EdgeInsets.only(top:10,left: 10,right: 10,bottom: 3),
 child: new Divider(color: Colors.black,),
),

Align(

 alignment: Alignment.center,

  child:new Text("Cashback Offer",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Color(0xff0a0047),),)
),

Padding(padding: EdgeInsets.only(bottom: 15),),




Container(
  // height: 359,
  child:    loading?SpinKitThreeBounce(
  color: Colors.pink,
  size: 50.0,
  
):response.data["cashback"].length<=0?Text("No cashback",textAlign: TextAlign.center,): CarouselSlider(
    height: 270, viewportFraction: 0.65,
      aspectRatio: 2.0,
      // autoPlay: true,
      enableInfiniteScroll:response.data["cashback"].length==1? false:true,
      enlargeCenterPage: true,
      
      items:

   
      
      ( response.data["cashback"] as List).map(
        (data) {
        
        // discount_inc++;       
          return 
            
new GestureDetector(

  child:
                new Card(
             
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                
              ),
             color: Color(0xffedf3ff),
            child: Container(
            width: 200,

            decoration: BoxDecoration(

    border: new Border.all(color: Colors.black87,),
                borderRadius: BorderRadius.circular(22.0),


            ),
child:Column(
              children: <Widget>[


// Padding(padding: EdgeInsets.only(left:50,right: 50),),



                Row(

mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
new Container(
  margin: const EdgeInsets.all(15.0),
  padding: const EdgeInsets.all(3.0),
  decoration: new BoxDecoration(
    color: Colors.lightGreen[100],
    border: new Border.all(color: Colors.pink,),
    borderRadius:new BorderRadius.all(Radius.circular(20.0)) ,
  ),
  child: new Text(" "+data["cashback_percent"].toString()+"% off " ,style: new TextStyle(),),
),

// Timer.periodic(Duration(seconds: 5), (timer) {
//   //print(DateTime.now());
// }),

Padding(padding: EdgeInsets.only(right:10),

child:

new Text(discount_time_diff[response.data["cashback"].indexOf(data)].toString().substring(0,8),style: new TextStyle(),)
 ),


                    
                  ],
                ),

                




          new ClipRRect(
    borderRadius: new BorderRadius.circular(15.0),
    child:Image.network(data["img_url"],
            // fit: BoxFit.fill,
            height: 120,
            width: 120,
         
          
          ),
),

Padding(padding: EdgeInsets.all(5),),

    new Text(data["name"],style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.brown),),
         
Padding(padding: EdgeInsets.all(5),),

Row(



mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: <Widget>[

    new Text(data["price"].toString(),style: new TextStyle(fontSize: 18,),),
    new Text(data["unit"].toString(),style: new TextStyle(fontSize: 18,color: Colors.grey),),



  ],
),


              
              ],

),
            ),
            ),


            onTap: (){


              //print(data["name"]);
            },
          );
       
      
       
        },
      
      
      ).toList(),
    
    
    
    ),
),
 
Padding(padding: EdgeInsets.all(5),),
loading?Padding(padding: EdgeInsets.all(1)):response.data["discount"].length<=0?Padding(padding: EdgeInsets.all(1),): Padding(
padding: EdgeInsets.only(right:10),
child:Align(


  alignment: Alignment.center,

  child: 
 new RaisedButton(color: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),), padding: EdgeInsets.all(15),
                      onPressed: (){
model.setProductlist(98);

                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
                     
                      },
                      child: new Text("     View More     ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
                  ),
), 


 ),
  







 Padding(padding: EdgeInsets.only(top:10,left: 10,right: 10,bottom: 30),
 child: new Divider(color: Colors.black,),
),

          ],
        )
      

    );
  }
}
