
import 'package:flutter/material.dart';
import 'Cart.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:provider/provider.dart';
import 'states.dart';

enum Departments { Production, Research, Purchasing, Marketing, Accounting }
 
Future<Departments> _asyncSimpleDialog(BuildContext context) async {
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
              title: new Text("Murali",style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            
            ),

            new ListTile(
  
              leading: Icon(Icons.phone,color:Colors.yellowAccent[800]),
              title: new Text("+918870970677",style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            trailing: new Text('Call Now'),
            onTap: (){

              launch("tel:8870970677");
            },
            ),
 new ListTile(
  
              leading: Icon(Icons.place,color:Colors.yellowAccent[800]),
              title: new Text("636451",style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            
            ),
 new ListTile(
  
              leading: Icon(Icons.location_city,color:Colors.yellowAccent[800]),
              title: new Text("Second Street",style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
            
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



var search = false;
var qty=1;

@override

  Widget build(BuildContext context) {

//  final counter = Provider.of<States>(context);

//    print(counter.toString());
    return new Scaffold(

            appBar: new AppBar(
        
        
        title:Text("Shopright"),
        

     



       actions: <Widget>[
      
 new Padding(
                padding: EdgeInsets.only(top: 5.0,right: 5),
                child: new Stack(
                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.shopping_cart),
                      onPressed: () {
                        _scaffoldKey3.currentState.openEndDrawer();
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
                      child: new Text(74.toString(),
                      
                      textAlign: TextAlign.center,
                      
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          
                        )
                      ),
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

backgroundColor: Colors.grey[200],

body:



 new SafeArea(child:
          new Column ( children: <Widget>[
            new Container (  height: MediaQuery.of(context).size.height*0.77, child:
              new SingleChildScrollView(child:
                new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[

Hero(

  tag: 'imgsr',

  child:  new Center  ( child:


                  Image.asset('assets/sr_logo.png',
            fit: BoxFit.fill,
          ),
          
          
          ),
),
                 






Align(alignment: Alignment.center,

child:Padding(padding: EdgeInsets.only(top:40,left:20,right: 20),child:Text("Orange",style: new TextStyle(color:  Color(0xff1103a8) ,fontSize: 35,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
 ),

// Padding(padding: EdgeInsets.all(10),child:new Divider(),),



Padding(padding: EdgeInsets.only(left: 30,top:5,bottom: 20), child:Text("550g",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey,),textAlign: TextAlign.left,), ),



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
                                
                                  setState(() {
                               qty++; 
                              });
                              
                             

                             
                              },
                            ),
                          ]),
                        ),
  ],
),


  ),



  new Text('₹ '+(54.00*qty).toString(),style: new TextStyle(fontSize: 35,color: Colors.brown),textAlign: TextAlign.center,)
],



),

Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top:15),child:
new Text("Description",style: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),),


),

Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),child:new Text('This is Description of the product This is Description of the product This is Description of the product This is Description of the product ',
style: new TextStyle(fontSize: 18,color:  Color(0xff495101)),
)),


new ListTile(
  
              leading: Icon(Icons.info,color:Colors.yellowAccent[800]),
              title: new Text("Vendor Info",style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
             onTap: 
             
             () async {
                final Departments deptName = await _asyncSimpleDialog(context);
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
                color: Colors.grey[100],
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
                new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.favorite_border,color: Colors.red,), label: new Text("Wishlist"),),
                new FlatButton.icon(onPressed: (){}, icon: new Icon(Icons.assignment,color: Colors.purple), label: new Text("Group")),
                new SizedBox(width: MediaQuery.of(context).size.width * 0.4, child:
                  new RaisedButton(color: Colors.amber, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)), padding: EdgeInsets.all(15),
                      onPressed: (){
                        // _cartBloc.addOrderToCart(widget.product, _quantity);
                        // Navigator.of(context).pop();
                      },
                      child: new Text("Add to cart", style: TextStyle(fontWeight: FontWeight.bold))
                  )
                )
              ]),
            )
          ])
      )











    );
  }



}