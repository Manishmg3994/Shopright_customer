import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'productlist.dart';
import 'productview.dart';
import 'Cart.dart';
import 'myorders.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'grouphome.dart';

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
  'https://breastcancer-news.com/wp-content/uploads/2018/07/shutterstock_793959790_zpsny04h5b8-1024x480.jpg'
  
   ];
// class AppHome extends StatefulWidget {

//   @override
//   _AppHomeState createState() => new _AppHomeState();
// }

// class _AppHomeState extends State<AppHome> with SingleTickerProviderStateMixin{


class AppHome extends StatelessWidget {



  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();




  

  @override




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

// onTap: ()=>print('cdfg'),

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

                  SearchView().showMaterialSearch(context);

              },
              ),

 new Padding(
                padding: EdgeInsets.only(top: 5.0,right: 5),
                child: new Stack(
                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.shopping_cart),
                      onPressed: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                    ),
                  
          new Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: new Icon(Icons.brightness_1, size: 22.0, 
                        color: Colors.redAccent),
                    ) ,



                    new Positioned(
                      
                      top: 4.0,
                      right: 5.0,
                      
                      // child: new Text(counter.getCart().toString(),
                      
                      // textAlign: TextAlign.center,
                      
                      //   style: new TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 12.0,
                      //     fontWeight: FontWeight.w600,
                          
                      //   )


                        child:  ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return Text(
                  model.counter.toString(),
                  
                  textAlign: TextAlign.center,
                      
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          
                        )
                );
              },
            ),
                      // ),
                    ) ,
                  
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
             

 accountName: Text('Dinesh Kumar',style: new TextStyle(fontSize: 25),),
                    accountEmail: Text('developine.com@gmail.com'),
                   
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
model.setProductlist(3);

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
  onSelected: (String selected) => print(selected)
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




       
        // body: _widgetOptions[0]
body:


     new ListView(


          children: <Widget>[


            new Row(
mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

new Row(children: <Widget>[
 Icon(Icons.place,size: 20,
 color: Colors.orange[600],),
Padding(padding: EdgeInsets.all(1),),
            Text('636452',style: new TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),)
         
            ,Text(' - First Zone ', overflow: TextOverflow.ellipsis,
    maxLines: 1,style: new TextStyle(color: Colors.brown),),


],),



Padding(padding: EdgeInsets.only(right: 20)),

    ButtonTheme(
           
  minWidth: 40.0,
  height: 30.0,
  buttonColor: Colors.pinkAccent,
          child:
          
       FlatButton(


         onPressed: (){print('Change Location');},

         child: Text('Change Location',style: new TextStyle(color:Colors.blue),),
       ),

          ),
              ],
            ),





Padding(padding: EdgeInsets.all(5),),

              CarouselSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      
      enlargeCenterPage: true,
      items: imgList.map(
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
model.setProductlist(1);
                  
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
  child: CarouselSlider(
    height: 300,
  
      viewportFraction: 0.65,
      aspectRatio: 2.0,
      // autoPlay: true,
      
      enlargeCenterPage: true,
      
      items: imgList.map(
        (url) {
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
  child: new Text(" 21% off " ,style: new TextStyle(),),
),


Padding(padding: EdgeInsets.only(right:10),

child:

new Text('12.08',style: new TextStyle(),)
 ),


                    
                  ],
                ),

                

Image.asset('assets/sr_logo.png',
            fit: BoxFit.fill,
         
          
          ),

Padding(padding: EdgeInsets.all(5),),

    new Text("Banana",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.brown),),
         
Padding(padding: EdgeInsets.all(5),),

Row(



mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: <Widget>[




    new Text("₹ 38.00",style: new TextStyle(fontSize: 18,),),
    new Text("2 kg",style: new TextStyle(fontSize: 18,color: Colors.grey),),



  ],
),


              
              ],

),
            ),
            ),


            onTap: (){


              print(url);
            },
          );
        },
      ).toList(),
    ),
),
 
Padding(padding: EdgeInsets.all(5),),
 Padding(
padding: EdgeInsets.only(right:10),
child:Align(


  alignment: Alignment.center,

  child: 
 new RaisedButton(color: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),), padding: EdgeInsets.all(15),
                      onPressed: (){
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
  child: CarouselSlider(
    height: 300,
  
      viewportFraction: 0.65,
      aspectRatio: 2.0,
      // autoPlay: true,
      
      enlargeCenterPage: true,
      
      items: imgList.map(
        (url) {
          return 
              
new GestureDetector(

  child:
                new Card(
             
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                
              ),
             color: Color(0xffffedf6),
            child: Container(
            width: 200,

            decoration: BoxDecoration(



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
  child: new Text(" 50% cashback " ,style: new TextStyle(),),
),


Padding(padding: EdgeInsets.only(right:10),

child:

new Text('10.00',style: new TextStyle(),)
 ),


                    
                  ],
                ),

                

Image.asset('assets/sr_logo.png',
            fit: BoxFit.fill,
         
          
          ),

Padding(padding: EdgeInsets.all(5),),

    new Text("Tomato",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.brown),),
         
Padding(padding: EdgeInsets.all(5),),

Row(



mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: <Widget>[




    new Text("₹ 20.00",style: new TextStyle(fontSize: 18,),),
    new Text("1 kg",style: new TextStyle(fontSize: 18,color: Colors.grey),),



  ],
),


              
              ],

),
            ),
            ),


            onTap: (){


              print(url);
            },
          );
        },
      ).toList(),
    ),
),

Padding(padding: EdgeInsets.all(5),),
 Padding(
padding: EdgeInsets.only(right:10),
child:Align(


  alignment: Alignment.center,

  child: 
 new RaisedButton(color: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),), padding: EdgeInsets.all(15),
                      onPressed: (){
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
