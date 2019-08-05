import 'package:flutter/material.dart';
import 'conformorder.dart';

// import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scopedmodel.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:provider/provider.dart';
// import 'states.dart';
import 'package:toast/toast.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CartView extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return CartViewState();
    }
}



class CartViewState extends State<CartView> {

var count = 2;
CounterModel model;
var myname= "",pincode="",area="",mobile="",token="",myid="";
var no_data=false;
var loading=true;
var base_url = "";
var staTus = [];

void productx(idx) async {
  setState(() {
 loading=true;
});
  
  try {
CounterModel model= ScopedModel.of(context);
   
Response response
    = await Dio().post(model.url+"api/removecart",data: {
       "customer_id":model.myid,
        "product_id":idx,
    
    }
    ,options: Options(headers: {"Authorization": model.token})
    );
    print(response.data);
    
    if(response.data["status"])
    {
     
          model.RemoveCart(idx);
  
setState(() {
 loading=false;
});
     

   }

    else{
     
setState(() {
     loading=false; 
     no_data=true;
    });
    }
    
  } catch (e) {
    print(e);
  }
}





void add(idx,index) async {
 
  
  try {
CounterModel model= ScopedModel.of(context);
   
Response response
    = await Dio().post(model.url+"api/qty_increase",data: {
       "customer_id":model.myid,
        "product_id":idx,
    
    }
    ,options: Options(headers: {"Authorization": model.token})
    );
    print(response.data);

    setState(() {


staTus[index] = false ;


    });
    
    if(response.data["status"])
    {
     

     
setState(() {
     model.cart[index]["my_qty"] =model.cart[index]["my_qty"]+1;
    });
         
     

   }

    else{

                 Toast.show("Something wrong",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);


    }
    
  } catch (e) {
    print(e);
  }
}








void minus(idx,index) async {
 
  
  try {
CounterModel model= ScopedModel.of(context);
   
Response response
    = await Dio().post(model.url+"api/qty_decrease",data: {
       "customer_id":model.myid,
        "product_id":idx,
    
    }
    ,options: Options(headers: {"Authorization": model.token})
    );
    print(response.data);

    setState(() {


staTus[index] = false ;


    });
    
    if(response.data["status"])
    {
     

     
setState(() {
     model.cart[index]["my_qty"] =model.cart[index]["my_qty"]-1;

     
    });
         
     

   }

    else{

                 Toast.show("Something wrong",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);


    }
    
  } catch (e) {
    print(e);
  }
}



// CounterModel model;
   @override
  void initState() {

    super.initState();
  }

 @override
    Widget build(BuildContext context) {
CounterModel stream= ScopedModel.of(context);

for (int i =0;i<stream.cart.length;i++){

  staTus.add(false);
}

      return new Container(
        decoration:   BoxDecoration(

          color: Colors.grey[100]
        ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child:
         ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return 
        
         new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.1),
              child: new Center(
                child: new Text("MY CART "),
              ),
            ),
            new Divider(),
            new Expanded(
//  child: ScopedModelDescendant<CounterModel>(
//               builder: (context, child, model) {
//                 return 

//   //             }),

           child:    (stream.cart.length == 0) ?
                new Center(child: new Text("No items in your cart",style: new TextStyle(fontSize: 25),) ,):


                // new ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: globals.cart.length,
                //   itemBuilder: (c, i) {
                //     return item(globals.cart.elementAt(i));
                //   },
                // ),

              


new ListView.builder(
        itemCount: stream.cart.length,
       
        itemBuilder: (BuildContext context, int index) {
          return
          
          //  new GestureDetector(
new Column(

  children: <Widget>[

   
  new Card(

    color:!(stream.cart[index]["product_available"]) ?Colors.grey[600]:!(stream.cart[index]["my_qty"]<=stream.cart[index]["on_move"]) ?Colors.grey[400]:Colors.white,
             shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                
              ),
elevation: 5.0,
// semanticContainer: true,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
  margin:  EdgeInsets.all(12.0),



child: new Column(



children: <Widget>[

  Padding(padding: EdgeInsets.all(5),),


  Row(

children: <Widget>[

 Expanded(
          flex: 4, // 
child: Image.network(stream.cart[index]["img_url"],
            // fit: BoxFit.fill,
         
           height: 80,
           width: 80,
          ),
 ),

  //imgeo



  Expanded(
          flex: 4, // 
child: new Column(
    
children: <Widget>[


Align(

  alignment: Alignment.center,

  child: new Text(stream.cart[index]["name"], overflow: TextOverflow.ellipsis,style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    maxLines: 2,),
),





Padding(padding: EdgeInsets.only(top:18,right: 10),

child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[


    Text('₹ '+stream.cart[index]["price"].toString()),

    Text(stream.cart[index]["unit"])
  ],
)),




],



  )

  )
],



  ),


   Padding(padding: EdgeInsets.all(1),
                                
                                
                               child: Divider(
                                  height: 10.0,
                                  color: Colors.redAccent,
                                ),
                                ),


//   Column(

//     children: <Widget>[
// Padding(


//   padding: EdgeInsets.only(bottom: 5),

//   child: RaisedButton(

//         onPressed: null,


//         child: Text('button'),
//       ),
// )

      
//     ],
//   ),

Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children: <Widget>[
// Padding(padding: EdgeInsets.only(left: 1),),

  Row(

    

mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
 
Padding(padding: EdgeInsets.only(left: 10)),

      SizedBox(
  width: 40, // specific value

  child: RaisedButton(
color: Colors.green,
 shape: new RoundedRectangleBorder(
         borderRadius: new BorderRadius.circular(100.0)),
        onPressed:!(stream.cart[index]["product_available"])?null: 
        
        
        (stream.cart[index]["my_qty"]> stream.cart[index]["on_move"])?null:
        
        
         staTus[index]?null:(){

          if(stream.cart[index]["my_qty"]<stream.cart[index]["on_move"]){

setState(() {
             staTus[index] =  true;
            });

add(stream.cart[index]["product_id"],index);



          }

          else{

                 Toast.show("Out of Quantity",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        
          }
 


          
        },


        child: Text('+',textAlign: TextAlign.center,style: new TextStyle(fontSize: 25,color: Colors.white),),
      ),
),


Padding(padding: EdgeInsets.only(left: 15,right: 15),
child:                                                     staTus[index]?SpinKitDoubleBounce(
  color: Colors.black,
  size: 15.0,
  
): Text(stream.cart[index]["my_qty"].toString(),style: new TextStyle(fontSize: 20),),),

     SizedBox(
  width: 40, // specific value
  child: RaisedButton(
color: Colors.blue,
shape: new RoundedRectangleBorder(
         borderRadius: new BorderRadius.circular(100.0)),
        onPressed:!(stream.cart[index]["product_available"])?null: staTus[index]?null: (){

          if(stream.cart[index]["my_qty"] > 1){

minus(stream.cart[index]["product_id"],index);


            setState(() {
             staTus[index] =  true;
            });



   }


          
  

    
    
    },


        child: Text('-',textAlign: TextAlign.center,style: new TextStyle(fontSize: 35,color: Colors.white),),
      ),
),




    ],
  ),
      

Padding(padding: EdgeInsets.only(right: 10),


child:GestureDetector(
  onTap: (){

// print(stream.cart[index]["product_id"]);
productx(stream.cart[index]["product_id"]);

  },

  child: Icon(Icons.delete,),
),


),




//       RaisedButton(
// color: Colors.transparent,

//  shape: new RoundedRectangleBorder(
   
//          borderRadius: new BorderRadius.circular(100.0)),
//         child: Icon(Icons.delete),
        
//         //  Text('Remove',textAlign: TextAlign.center,style: new TextStyle(fontSize: 14,color: Colors.white),),
//       ),




    
  ],
),

!(stream.cart[index]["product_available"] )?

Padding(padding: EdgeInsets.only(top: 3,bottom: 5),
child:

    Text("-Out of Stock-",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.right,)
):
    
 
 
 !(stream.cart[index]["my_qty"]<=stream.cart[index]["on_move"]) ?
 
 Padding(padding: EdgeInsets.only(top: 3,bottom: 5),
child:

    Text("Out of Qty. Please decrease Quantity",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 13),textAlign: TextAlign.right,)
):
  Padding(padding: EdgeInsets.all(5),)
],









//   children: <Widget>[
//     Padding(padding: EdgeInsets.only(top: 25),),
//  Image.asset('assets/sr_logo.png',
//             // fit: BoxFit.fill,
         
//            height: 100,
//            width: 100,
//           ),
//     Padding(padding: EdgeInsets.only(top: 15),),

         
//    Padding(padding: EdgeInsets.only(top: 15,left: 10),
//  child: Align(

//   alignment: Alignment.centerLeft,

//           child:new Text('₹ 54.00',style: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),

//    ),
//   Padding(padding: EdgeInsets.only(top: 8,left: 10),
//  child: Align(

//   alignment: Alignment.center,

//           child:new Text('ty[index]',style: new TextStyle( fontSize: 16,fontWeight: FontWeight.bold,color: Colors.brown),textAlign: TextAlign.left,
//           overflow: TextOverflow.ellipsis,
//     maxLines: 1,
          
          
//           )),

//    ),

//   Padding(padding: EdgeInsets.only(top: 3,right: 10,bottom: 10),
//  child: Align(

//   alignment: Alignment.bottomRight,

//           child:new Text('500g',style: new TextStyle(fontSize: 14),textAlign: TextAlign.left,)),

//    ),




//   ],







),





















              
            ),
// new Text('hjgyugh',style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,  color: Colors.green),)

  ],
);
 
            // onTap: () {
            //  print(index);
            // // Navigator.of(context).pop();
            //     // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new WebViewContainer(list[index].link,list[index].name)));
               
            // },
          // );



          
        }),


                
            ),
            new Divider(),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new RaisedButton(
                      onPressed: () {
                       
// Navigator.of(context).pop();
                        !(stream.cart.length == 0) ? 
                       
                   Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) =>
                    new ConfirmOrderPage()))
 : Navigator.of(context).pop();
                      },
                      child: (stream.cart.length == 0) ? new Text("Start Shopping") : new Text("Checkout"),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                    )
                  )
                ],
              ),
            )
          ],
        );
     
     
     
 }),
     
     
     
     
     
     
     
     
     
     
     
     
      );
// return new Text('data');
    }
}