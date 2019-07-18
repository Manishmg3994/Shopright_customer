import 'package:flutter/material.dart';
import 'conformorder.dart';

import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';

class CartView extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return CartViewState();
    }
}



class CartViewState extends State<CartView> {

var count = 2;


// CounterModel model;
   @override
  void initState() {
// model= ScopedModel.of(context);
//     print(stream.cart.toString());
//     print(stream.cart[0].length.toString());
    super.initState();
  }

 @override
    Widget build(BuildContext context) {
CounterModel stream= ScopedModel.of(context);

      return new Container(
        decoration:   BoxDecoration(

          color: Colors.grey[100]
        ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child: new Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.1),
              child: new Center(
                child: new Text("MY CART "),
              ),
            ),
            new Divider(),
            new Expanded(
              child: (count == 0) ?
                new Center(child: new Text("No items in your cart",style: new TextStyle(fontSize: 25),) ,):


                // new ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: globals.cart.length,
                //   itemBuilder: (c, i) {
                //     return item(globals.cart.elementAt(i));
                //   },
                // ),


new ListView.builder(
        itemCount: stream.cart[0].length,
       
        itemBuilder: (BuildContext context, int index) {
          return
          
          //  new GestureDetector(
new Column(

  children: <Widget>[

   
  new Card(
             shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                
              ),
elevation: 5.0,
// semanticContainer: true,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
  margin:  EdgeInsets.all(12.0),



child: new Column(



children: <Widget>[



  Row(

children: <Widget>[

 Expanded(
          flex: 4, // 
child: Image.network(stream.cart[0][index]["img_url"],
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

  child: new Text(stream.cart[0][index]["name"], overflow: TextOverflow.ellipsis,style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    maxLines: 2,),
),





Padding(padding: EdgeInsets.only(top:18,right: 10),

child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[


    Text('₹ '+stream.cart[0][index]["price"].toString()),

    Text(stream.cart[0][index]["unit"])
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

mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
 


      SizedBox(
  width: 50, // specific value
  child: RaisedButton(
color: Colors.green,

        onPressed: ()=>{
 setState(() {
      count=count+1;
    })


          
        },


        child: Text('+',textAlign: TextAlign.center,style: new TextStyle(fontSize: 25,color: Colors.white),),
      ),
),


Padding(padding: EdgeInsets.only(left: 15,right: 15),
child: Text(stream.cart[0][index]["my_qty"].toString(),style: new TextStyle(fontSize: 20),),),

     SizedBox(
  width: 50, // specific value
  child: RaisedButton(
color: Colors.red,
        onPressed: ()=>{

          stream.RemoveCart(stream.cart[0][index]["product_id"])
          
    //        setState(() {
    //   count= count-1;
    // })
    
    
    },


        child: Text('-',textAlign: TextAlign.center,style: new TextStyle(fontSize: 35,color: Colors.white),),
      ),
),




    ],
  ),

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
                        Navigator.of(context).pop();
                   Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ConfirmOrderPage()));


                        (1 == 0) ? print("no items") : print("yes");
                      },
                      child: (1 == 0) ? new Text("Start Shopping") : new Text("Checkout"),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                    )
                  )
                ],
              ),
            )
          ],
        )
      );
// return new Text('data');
    }
}