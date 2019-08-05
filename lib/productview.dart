
import 'package:flutter/material.dart';
import 'Cart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toast/toast.dart';
import 'scopedmodel.dart';
import 'choosegroup.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:provider/provider.dart';
// import 'states.dart';

enum Departments { Production, Research, Purchasing, Marketing, Accounting }
 
Future<Departments> _asyncSimpleDialog(BuildContext context,String name,String mobile,String pincode, String area) async {
  return await showDialog<Departments>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title:  Text('Vendor Info',style: new TextStyle(fontSize: 25,),textAlign: TextAlign.center,),
          children: <Widget>[
            // SimpleDialogOption(
            //   onPressed: () {
            //     Navigator.pop(context, Departments.Production);
            //   },
            //   child: const Text('Production'),
            // ),

            // new Text('data'),

            new ListTile(
  
              leading: Icon(Icons.person),
              title: new Text(name,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            
            ),

            new ListTile(
  
              leading: Icon(Icons.phone,color:Colors.yellowAccent[800]),
              title: new Text(mobile,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            trailing: new Text('Call Now'),
            onTap: (){

              launch("tel:"+mobile);
            },
            ),
 new ListTile(
  
              leading: Icon(Icons.place,color:Colors.yellowAccent[800]),
              title: new Text(pincode,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            
            ),
 new ListTile(
  
              leading: Icon(Icons.location_city,color:Colors.yellowAccent[800]),
              title: new Text(area,style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            
            ),




     



          ],
        );
      });
}


class ProductView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProductViewState();
  }
}

class ProductViewState extends State<ProductView> {
   GlobalKey<ScaffoldState> _scaffoldKey3 = new GlobalKey<ScaffoldState>();
var loading=true;
var wloading=false;
var base_url = "";
List data = new List();
Response response;
var token="";
var cart = false;
var wishlist = false;
var search = false;
var qty=1;
var idx="";
var myidx="";
var pincode ="";
var area = "";



void add_cart() async {
  setState(() {
   wloading =true; 
  });
  
  try {
   
   response = await Dio().post(base_url+"api/addcart",data: {
      //  "customer_id":id1,
      //   "product_id":id2

       "customer_id":myidx,
        "product_id":idx,
        "qty":qty,
        "pincode":pincode,
        "area":area
    
    }
    ,options: Options(headers: {"Authorization": token})
    );
    // print(response.data);

  setState(() {
   wloading =false; 
  });
if(response.data["status"]){
setState(() {
  cart = true;

});
                 Toast.show("Added Successfully",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                 AddTo();

}

else{

                 Toast.show("Something wrong. Try again...",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}
    
  } catch (e) {
    print(e);
  }
}


void add_wishlist() async {
 
  
  try {
   
   response = await Dio().post(base_url+"api/addwishlist",data: {
      //  "customer_id":id1,
      //   "product_id":id2

       "customer_id":myidx,
        "product_id":idx,
    
    }
    ,options: Options(headers: {"Authorization": token})
    );
    // print(response.data);

if(response.data["status"]){
setState(() {
 wishlist=true; 
});
                 Toast.show("Added to Wishlist",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}

else{

                 Toast.show("Something wrong. Try again...",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}

    
  } catch (e) {
    print(e);
  }
}


void remove_wishlist() async {
 
  
  try {
   
   response = await Dio().post(base_url+"api/removewishlist",data: {
      //  "customer_id":id1,
      //   "product_id":id2

       "customer_id":myidx,
        "product_id":idx,
    
    }
    ,options: Options(headers: {"Authorization": token})
    );
   if(response.data["status"]){

 setState(() {
 wishlist=false; 
});
                 Toast.show("Removed from Wishlist",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}

else{

                 Toast.show("Something wrong. Try again...",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}
   
  } catch (e) {
    print(e);
  }
}



void productx() async {
  setState(() {
 loading=true;
});
  
  try {
   
   response = await Dio().post(base_url+"api/product_detail",data: {
      //  "customer_id":id1,
      //   "product_id":id2

       "customer_id":myidx,
        "product_id":idx,
    
    }
    ,options: Options(headers: {"Authorization": token})
    );
    print(response.data["result"]);
    
    if(response.data["status"])
    {
   data = response.data["result"];
setState(() {
 loading=false;
 wishlist=data[0]["wishlist"];
 cart = data[0]["cart"];
});
     

   }

    else{
     
setState(() {
     loading=false; 
    //  no_data=true;
    });
    }
    
  } catch (e) {
    print(e);
  }
}




void AddTo() async {

 
  try {
   
    CounterModel model = ScopedModel.of(context);
 
 
     response = await  Dio().post(base_url+"api/cartproduct",
     
     data: {
       "customer_id":myidx,
        "pincode":pincode,
        "area":area
    
    }
    ,options: Options(headers: {"Authorization": token})
    );
    print(response.data);
    



    if(response.data["status"])
    {
 model.SetCartQty(response.data["result"].length) ;


 model.SetCart(response.data["result"] as List);


   }

    else{

    }
    
  } catch (e) {
    print(e);
  }
}














getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
CounterModel model = ScopedModel.of(context);
//  print(model.myid);

 setState(() {
  // myname =  prefs.getString("myname");
  pincode=prefs.getString("pincode");
  area=prefs.getString("area");
  myidx=prefs.getString("myid") ;
  token=prefs.getString("token");
 
//  base_url = model.url; 
model.setMyid(model.myid);
 });
productx();
print(myidx);
  }


  @override
  void initState() {
   
CounterModel model = ScopedModel.of(context);
setState(() {
 idx=model.productid; 
//  myidx=model.myid;
 base_url = model.url; 

});
getSharedPreferences();

print(idx);
// print(base_url);
}


@override

  Widget build(BuildContext context) {
final key = new GlobalKey<ScaffoldState>();
//  final counter = Provider.of<States>(context);

//    print(counter.toString());
// CounterModel model = ScopedModel.of(context);

    return new Scaffold(

            appBar: new AppBar(
        key: key,
        
        title:Text("Shopright"),
        

     



       actions: <Widget>[
      
 new Padding(
                padding: EdgeInsets.only(top: 5.0,right: 5),
                child:
               ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return 
                 new Stack(
                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.shopping_cart),
                      onPressed: () {
                        // _scaffoldKey3.currentState.openEndDrawer();

                         Scaffold.of(context).openEndDrawer(); 

                      },
                    ),
                  
          new Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: new Icon(Icons.brightness_1, size: 22.0, 
                        color: Colors.redAccent),
                    ) ,



                    new Positioned(
                      
                      top: 6.0,
                      right: model.cart.length >= 10? 6.0:7.0,
                    //  top: 6.0,
                    //   right: 7.0,
                      child: new Text(model.cart.length.toString(),
                      
                      textAlign: TextAlign.center,
                      
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          
                        )
                      ),
                    ) ,
                  
                  ],
                );
              })
              
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

backgroundColor:loading?Colors.grey[200]:data[0]["on_move"]>0? Colors.grey[200]:Colors.grey[500],

body:


 loading?SpinKitThreeBounce(
  color: Colors.pink,
  size: 50.0,
  
):

 new SafeArea(child:
          new Column ( children: <Widget>[
            new Container (  height: MediaQuery.of(context).size.height*0.77, child:
              new SingleChildScrollView(child:
                new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[


Padding(padding: EdgeInsets.all(10),),


  new Center  ( 
 child: Container(
            width: 200,

            decoration: BoxDecoration(

    border: new Border.all(color: Colors.black87,),
                borderRadius: BorderRadius.circular(22.0),


            ),

             child:   new ClipRRect(
    borderRadius: new BorderRadius.circular(22.0),
    child: Image.network(
        data[0]["img_url"],
       fit: BoxFit.fill,
    ),
)
     
 )
          
          
          ),

                 






Align(alignment: Alignment.center,

child:Padding(padding: EdgeInsets.only(top:15,left:20,right: 20),child:Text(data[0]["name"],style: new TextStyle(color:  Color(0xff1103a8) ,fontSize: 35,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
 ),

// Padding(padding: EdgeInsets.all(10),child:new Divider(),),


new Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,

children: <Widget>[
Padding(padding: EdgeInsets.only(left: 30,top:5,bottom: 20), child:Text(data[0]["unit"],style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey,),textAlign: TextAlign.left,), ),
Padding(padding: EdgeInsets.only(right: 30,top:5,bottom: 20), child:Text("Available: "+data[0]["on_move"].toString(),style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey,),textAlign: TextAlign.left,), ),
]
),

new Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,



children: <Widget>[




  new Container(

child: new Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,


  children: <Widget>[

   new Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue), borderRadius: BorderRadius.circular(50)), child:
                          new Row(children: <Widget>[
                            new InkWell(
                              child: new Icon(Icons.remove, size: 25,color: Colors.redAccent,),
                              onTap:(){
                                
                                
                              
                              
                               if(qty<=1){
                                 setState(() {
                               qty=1;
                              });
                              
                              }

                              else{

                                {setState(() {
                               qty--; 
                              });}
                              }
                              
                              
                              }
                            ),
                            new Padding(padding: EdgeInsets.symmetric(horizontal: 40), child: new Text(qty.toString(), style: TextStyle(fontSize: 22))),
                            new InkWell(
                              child: new Icon(Icons.add, size: 25,color: Colors.green,),
                              onTap: (){

                                if(qty<data[0]["on_move"])
                                {

                                    setState(() {
                               qty++; 
                              });
                                }
                                
                                else{

                 Toast.show("Out of Limit",context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


                 }
                              
                             

                             
                              },
                            ),
                          ]),
                        ),
  ],
),


  ),



  new Text('₹ '+(data[0]["price"]*qty).toString(),style: new TextStyle(fontSize: 35,color: Colors.brown),textAlign: TextAlign.center,)
],



),
Padding(padding: EdgeInsets.only(left: 10,right: 10,top:5),child:Divider()),

Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top:15),child:
new Text("Description",style: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),),


),

Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),child:new Text(data[0]["description"],
style: new TextStyle(fontSize: 18,color:  Color(0xff495101)),
)),

Padding(padding: EdgeInsets.only(left: 10,right: 10,top:5),child:Divider()),

new ListTile(
  
              leading: Icon(Icons.info,color:Colors.yellowAccent[800]),
              title: new Text("Vendor Info",style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
             onTap: 
             
             () async {
                final Departments deptName = await _asyncSimpleDialog(context,data[0]["vendor_name"],
                data[0]["vendor_mobile"],data[0]["pincode"],data[0]["area"].toString());
                print("Selected Departement is $deptName");
              },

// ()=> SimpleDialog(children: <Widget>[

//   new Text("tcvrt")
// ],)

            ),

Padding(padding: EdgeInsets.all(10),),

//                 new Center(

//                   child:  new RaisedButton(color: Colors.amber, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//                       onPressed: (){
//                         // _cartBloc.addOrderToCart(widget.product, _quantity);
//                         // Navigator.of(context).pop();
//                       },
//                       child: new Text("Contact Vendor", style: TextStyle(fontWeight: FontWeight.bold))
//                   ),
//                 ),


// Padding(padding: EdgeInsets.all(30),)


],)
   ),


),






            new Container ( decoration: BoxDecoration(boxShadow:  [
              BoxShadow(
                color: data[0]["on_move"]>0? Colors.grey[200]:Colors.grey[500],
                blurRadius: 30.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -20.0, // vertical, move down 10
                ),
              )
            ]),
            
            
            
             padding: EdgeInsets.symmetric(horizontal: 5),
              // height: MediaQuery.of(context).size.height*0.1,
             
              child:
              new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                new FlatButton.icon(onPressed: (){

if(wishlist){

remove_wishlist();



}

else{
  add_wishlist();


}
                    


                }, icon: 
                wishlist?
                new Icon(Icons.favorite,color: Colors.red,):
                new Icon(Icons.favorite_border,color: Colors.black,),
                
                 label: new Text("Wishlist"),),
                new FlatButton.icon(onPressed: (){


CounterModel model = ScopedModel.of(context);

model.SetQty(qty);
                  

                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ChooseGroup()));
                  
                }, icon: new Icon(Icons.assignment,color: Colors.purple), label: new Text("Group")),
               
               
               
                new SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                
                
                
            !(data[0]["on_move"]>0)?new RaisedButton(color: Colors.amber[200], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)), padding: EdgeInsets.all(15),
                      onPressed: (){
                        // _cartBloc.addOrderToCart(widget.product, _quantity);
                        // Navigator.of(context).pop();
                 Toast.show("Out of Stock",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                        
                      },
                      child: new Text("Out of Stock", style: TextStyle(fontWeight: FontWeight.bold))
                  ):
   cart? 
             new RaisedButton(color: Colors.amber[200], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)), padding: EdgeInsets.all(15),
                      onPressed: (){
                        // _cartBloc.addOrderToCart(widget.product, _quantity);
                        // Navigator.of(context).pop();
                 Toast.show("This product already in Cart",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                        
                      },
                      child: new Text("Already in cart", style: TextStyle(fontWeight: FontWeight.bold))
                  ):

                  new RaisedButton(color: Colors.amber[700], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)), padding: EdgeInsets.all(15),
                      onPressed: (){
                        // _cartBloc.addOrderToCart(widget.product, _quantity);
                        // Navigator.of(context).pop();
                        add_cart();
                      },
                      child: 
 wloading?SpinKitThreeBounce(
  color: Colors.white,
  size: 12.0,
  
):new Text("Add to cart", style: TextStyle(fontWeight: FontWeight.bold))
                  )




                )
              ]),
            )
          ])
      )











    );
  }



}