import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toast/toast.dart';
import 'scopedmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_upi/flutter_upi.dart';

import 'package:scoped_model/scoped_model.dart';
import 'scopedmodel.dart';
import 'home.dart';
import 'package:scoped_model/scoped_model.dart';
class ConfirmOrderPage extends StatefulWidget{
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {




  
void ConformOrder() async {



CounterModel model = ScopedModel.of(context);
 
   print(response.data["order_id"]);

   
  try {
   
 Response response1 =  await Dio().post(model.url+"api/conform_order",data: 
      
      
      {
"conform_id":	response.data["order_id"],
 "name": myname,
            "mobile": mobile,
            "address": door+","+adr1+","+adr2+","+pincode,
            "pay_method": payOption,
            "transaction_id":transaction_id
            
}



    
    ,options: Options(headers: {"Authorization": token})
    );
    // print("response1.data");
    // print(response1.data);

  
if(response1.data["status"]){

 showDialog(
   barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Ordered successfully"),
          content: new Text("Thank you for order"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new AppHome()));

                // Navigator.of(context).pop();

                // print("hfjh");
              },
            ),
          ],
        );
      },
    );


}

else{

                 Toast.show("Something wrong. Try again...",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}




    
  } catch (e) {
    print(e);
  }



}






String token,myid,myname,mobile,area,pincode,door,adr1,adr2;
  var loading = true;
  var payment = false;
  var payOption = "";
var transaction_id = "";
//   final String address = "Chabahil, Kathmandu";
// List<String> imglist = ["dfcdf","dfcdf","dfcdf","dfcdf","dfcdf",];
//   final String phone="9818522122";


Response response;

  final double total = 500;

  final double delivery = 0.00;

   Future _initiateTransaction;
  GlobalKey<ScaffoldState> _key;

// TextEditingController _controller1 = new TextEditingController();

// TextEditingController _controller2 = new TextEditingController();

// TextEditingController _controller3 = new TextEditingController();

// TextEditingController _controller4 = new TextEditingController();

  @override
  void initState() {
   
getSharedPreferences();
    _key = GlobalKey<ScaffoldState>();

    super.initState();
  }


 Future<String> initTransaction() async {
    String responseUpi = await FlutterUpi.initiateTransaction(
        app: FlutterUpiApps.GooglePay,
        pa: "sasaw.wahab12@oksbi",
        pn: "Wahab Sasaw",
        tr: "shopright",
        tn: "Pay to Shopright",
        am: response.data["grand_total"].toString(),
        cu: "INR",
        url: "https://www.google.com");
    // print(response);


        
                     

                      switch (responseUpi.toString()) {
                        case 'app_not_installed':
               
                 Toast.show("Application not installed.",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                          break;
                        case 'invalid_params':
                         
                 Toast.show("Request parameters are wrong",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                          break;
                        case 'user_canceled':
                 Toast.show("User canceled the flow",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                        
                          break;
                        case 'null_response':
                 Toast.show("No data received",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                        
                          break;
                        default:
                          {
                           
                           
                           
   FlutterUpiResponse flutterUpiResponse = FlutterUpiResponse(responseUpi);
// print("flutterUpiResponse.txnId"); // prints transaction id
// print(flutterUpiResponse.txnId); // prints transaction id
// print("flutterUpiResponse.txnRef"); //prints transaction ref 
// print(flutterUpiResponse.txnRef); //prints transaction ref 
// print("flutterUpiResponse.Status"); //prints transaction status
// print(flutterUpiResponse.Status); //prints transaction status
// print("flutterUpiResponse.ApprovalRefNo"); //prints approval reference number
// print(flutterUpiResponse.ApprovalRefNo); //prints approval reference number
// print("flutterUpiResponse.responseCode");
// print(flutterUpiResponse.responseCode);
                          



                          if(flutterUpiResponse.Status == "SUCCESS"){

                            setState(() {
                             transaction_id =  flutterUpiResponse.txnId;
                            });


                            ConformOrder();



                          }
                          
                          }
                      }
                   
                



// print("flutterUpiResponse"); // prints transaction id



    return responseUpi;
  }








void add_cart() async {

  // print(payment);
CounterModel model = ScopedModel.of(context);
 
  
  try {
   
   response = await Dio().post(model.url+"api/checkout",data: {
      //  "customer_id":id1,
      //   "product_id":id2

        "customer_id":myid,
        "pincode":pincode,
        "area":area
    }
    ,options: Options(headers: {"Authorization": token})
    );
    // print(response.data);

  
if(response.data["status"]){

setState(() {
 loading = false; 
});

                //  Toast.show("Added Successfully",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}

else{

                 Toast.show("Something wrong. Try again...",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}
    
  } catch (e) {
    print(e);
  }
}






getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
 setState(() {
   
  pincode=prefs.getString("pincode");
  area=prefs.getString("area");
  myid=prefs.getString("myid") ;
  token=prefs.getString("token");
  mobile = prefs.getString("mobile");
  door = prefs.getString("door");
  adr1 = prefs.getString("adr1");
  adr2 = prefs.getString("adr2");
  myname = prefs.getString("myname");



 
 });

//  print(myid);


add_cart();


  }







  @override
  Widget build(BuildContext context) {
    // _controller1.text='Dinesh Kumar';
    // _controller2.text='9876553534';
    // _controller3.text='17/1-170B';
    // _controller4.text='Near bus stand';
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
      ),
      body:
      
       loading?SpinKitThreeBounce(
  color: Colors.pink,
  size: 50.0,
  
): _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
          child: Column(
            children: <Widget>[
Padding(padding: EdgeInsets.all(5),),
              new Container(
  height: 120.0,
  color: Colors.grey[200],
  child:
  new ListView.builder(
        itemCount: response.data["result"].length,
       
        itemBuilder: (BuildContext context, int index) {
          return


          Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
Padding(padding: EdgeInsets.all(10),),
            
Expanded(
          flex: 5,
  child: Text(response.data["result"][index]["name"],style: new TextStyle(fontSize: 22),),
),
Expanded(
          flex: 3,
  child:  Text('₹ '+response.data["result"][index]["price"].toString() +" X "+response.data["result"][index]["qty"].toString()),
),

//   Expanded(
//           flex: 3,
//   child:  Text(response.data["result"][index]["qty"].toString()),
// ),

  Expanded(
          flex: 3,
  child:  Text('₹ '+response.data["result"][index]["total"].toString(),style: new TextStyle(fontSize: 15),),
      
  )
          // Text(response.data["result"][index]["qty"].toString()),
          // Text('₹ '+response.data["result"][index]["total"].toString()),



            ],
          );


          // Text(response.data["result"][index]["name"]);

        })
  
    


),

Padding(padding: EdgeInsets.all(5),),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Text("Subtotal"),
              //     Text("Rs. $total"),
              //   ],
              // ),
              // SizedBox(height: 10.0,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     Text("Delivery fee"),
              //     Text("Rs. $delivery"),
              //   ],
              // ),
              // SizedBox(height: 10.0,),  
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Total  -  ₹"+response.data["grand_total"].toString(), style: Theme.of(context).textTheme.title,),
                  Text("         ", style: Theme.of(context).textTheme.title),
                ],
              ),
              SizedBox(height: 20.0,),
              Container(
                color: Colors.grey.shade200,
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                child: Text("Delivery Address".toUpperCase())
              ),
              Column(
                children: <Widget>[

// TextFormField(
  
//   decoration: InputDecoration(
//     labelText: 'Name',

  
    
//   ),
//   controller: _controller1,



//   // initialValue: 'Dinesh Kumar',
  
// ),TextFormField(
// decoration: InputDecoration(
//     labelText: 'Mobile',

    
    
//   ),
// // initialValue: '9998767854',
//   controller: _controller2,
// ),
// TextFormField(
  
//   decoration: InputDecoration(
//     labelText: 'Door No.',
    
//   ),
//   controller: _controller3,

// ),TextFormField(
  
//   decoration: InputDecoration(
//     labelText: 'Landmark',
    
//   ),
//   controller: _controller4,

// ),


           

 Padding(padding: EdgeInsets.all(5),),
       new Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

               
            Text(myname,style: new TextStyle(fontSize: 18,color: Colors.brown,),)
         
            ,Text(mobile,style: new TextStyle(color: Colors.brown,fontSize: 18),),

              ],
            ),






       new Row(
mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
Padding(padding: EdgeInsets.only(top: 10),

child: new Row(children: <Widget>[
//  Icon(Icons.place,size: 20,
//  color: Colors.grey[600],
//  ),
Padding(padding: EdgeInsets.all(1),),

            Text(door+", ",style: new TextStyle(fontSize: 15,color: Colors.black,),),
            Text(adr1+", ",style: new TextStyle(fontSize: 15,color: Colors.black,),),
            Text(adr2+", ",style: new TextStyle(fontSize: 15,color: Colors.black,),),
            Text(area+", ",style: new TextStyle(fontSize: 15,color: Colors.black,),),
            Text(pincode,style: new TextStyle(fontSize: 15,color: Colors.black,),),


],),

),

Padding(padding: EdgeInsets.all(5),),


              ],
            ),



           
               
                ],
              ),
              SizedBox(height: 20.0,),
              Container(
                color: Colors.grey.shade200,
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                child: Text("Payment Option".toUpperCase())
              ),
              // RadioListTile(
              //   groupValue: true,
              //   value: true,
              //   title: Text("Cash on Delivery"),
              //   onChanged: (value){},
              // ),
RadioButtonGroup(
  labels: <String>[
    "Wallet",
    "Cash on Delivery",
    "Google Pay",
   
  ],
  onSelected: (String selected) {

    setState(() {
      payOption = selected;
     payment = true; 
    });
  },
  padding: EdgeInsets.all(2),
  labelStyle: new TextStyle(fontWeight: FontWeight.bold),
),

Padding(padding: EdgeInsets.all(8),),
             Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    

                    if(payment){



                      if(payOption == "Google Pay"){
 _initiateTransaction =
                      initTransaction();


                      }


                      else if(payOption ==  "Wallet"){


                 Toast.show("This option not available now..",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                      }


 else if(payOption == "Cash on Delivery"){

 ConformOrder();
 }

                   







                    }

                    else{

 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please choose anyone payment method"),
          // content: new Text("Thank you for order"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                // Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new AppHome()));

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );


                    }
                    
                    
                    
                    },
                   
                  child: Text("Confirm Order", style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
           
           
           
           
           
            //  FutureBuilder(
            //       future: _initiateTransaction,
            //       builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                    
            //         if (snapshot.connectionState == ConnectionState.waiting ||
            //             snapshot.data == null) {
            //           return Text("Processing or Yet to start...");
            //         } else {
                     

            //           switch (snapshot.data.toString()) {
            //             case 'app_not_installed':
            //     return
            //      Toast.show("Application not installed.",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

            //               break;
            //             case 'invalid_params':
                         
            //      Toast.show("Request parameters are wrong",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

            //               break;
            //             case 'user_canceled':
            //      Toast.show("User canceled the flow",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                        
            //               break;
            //             case 'null_response':
            //      Toast.show("No data received",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                        
            //               break;
            //             default:
            //               {
            //                 FlutterUpiResponse flutterUpiResponse =
            //                     FlutterUpiResponse(snapshot.data);
            //                 print(flutterUpiResponse.txnId);
            //                 print(flutterUpiResponse.Status);
            //                 print(flutterUpiResponse.ApprovalRefNo ?? "");
            //                 print(flutterUpiResponse.responseCode);
                           
                          
                          
            //               }
            //           }
            //         }
            //       },
            //     ),
    
           
           
           
           
            ],
          ),
        );
  }
}