import 'package:flutter/material.dart';
import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:provider/provider.dart';
// import 'states.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class MyOrders extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return MyOrdersState();
    }
}

class MyOrdersState extends State<MyOrders> {
List<String>  lst = ["fdcd","rdfg","drgcrdgcr"];
var myname= "",pincode="",area="",mobile="",token="",myid="";
var no_data=false;
var loading=true;
var base_url = "";
Response response;
List alldata = new List();

void productx(base_url,cat) async {
  setState(() {
 loading=true;
});
  
  try {
   
   response = await Dio().post(base_url+"api/my_all_orders",data: {
     "customer_id": myid  
    
    }
    ,options: Options(headers: {"Authorization": token})
    );
    // print(response.data);
    
    if(response.data["status"])
    {
     
   alldata =  response.data["result"];
setState(() {
 loading=false;
});
     
print(alldata);
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

getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
CounterModel model = ScopedModel.of(context);
 print(model.myid);

 setState(() {
  myid =  prefs.getString("myid");
  pincode=prefs.getString("pincode");
  area=prefs.getString("area");
 
  token=prefs.getString("token");
 
 base_url = model.url; 

 });
productx(model.url,model.productlist);

  }

 @override
  void initState() {
    getSharedPreferences();

    super.initState();
  }

  

  var name = ['Dinesh','kumar','rafi'];
  var order  = ['Cancel Order','Delivered','3'];
 @override
    Widget build(BuildContext context) {

       return new Scaffold(

         backgroundColor: Colors.grey[200],


        // key: _scaffoldKey,
        appBar: AppBar(
          
          title: Text('My Orders'),
          
        ),





        body: ListView.builder(
            itemCount: alldata.length,
            itemBuilder: (BuildContext cont, int ind) {
              return SafeArea(
                  child: Column(children: <Widget>[
                Container(
                    // margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                    // color:Colors.black12,
                    padding: EdgeInsets.all(5),
                    child: Card(
                        elevation: 3.0,
                        child: Container(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 10.0, 10.0),
                            child: GestureDetector(
                                child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // three line description
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                   alldata[ind]["name"],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black87,
                                      // fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 3.0),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Ordered On :' +
                                       ' 03.12.2019',
                                    style: TextStyle(
                                        fontSize: 13.0, color: Colors.black54),
                                  ),
                                ),

                                Padding(padding: EdgeInsets.all(10),
                                
                                
                               child: Divider(
                                  height: 10.0,
                                  color: Colors.redAccent,
                                ),
                                ),
                                

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(3.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Order Id',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black54),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 3.0),
                                              child: Text(
                                                'SR_093G678',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.black87),
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                        padding: EdgeInsets.all(3.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Order Amount',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black54),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 3.0),
                                              child: Text(
                                                alldata[ind]["total"].toString(),
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                        padding: EdgeInsets.all(3.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Payment Type',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black54),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 3.0),
                                              child: Text(
                                                 alldata[ind]["pay_method"],
                                                // "COD",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.black87),
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                                 Padding(padding: EdgeInsets.all(10),
                                
                                
                               child: Divider(
                                  height: 10.0,
                                  color: Colors.redAccent,
                                ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 20.0,
                                        color: Colors.amber.shade500,
                                    ),
                                    Text( alldata[ind]["address"],
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black54)),
                                  ],
                                ),
                            
                                // Container(
                                //  child:_status(order[ind])
                                // ),

 new ExpansionTile(

                  title: new Text("View Products"),

                  

children: <Widget>[

Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[

Expanded(
flex: 4,
   child:Text("Name",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),textAlign: TextAlign.center,),
  
),Expanded(
flex: 2,
   child:Text("Price",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),textAlign: TextAlign.center,),
  
),Expanded(
flex: 1,
   child:Text("Qty",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),textAlign: TextAlign.center,),
  
),Expanded(
flex: 3,
   child:Text("Status",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),textAlign: TextAlign.center,),
  
),
  // Text("Price",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),),
  // Text("Qty",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),),
  // Text("Status",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),),
],
),

Divider(),

 new Container(
              height:alldata[ind]["products"].length>8? 100.0:alldata[ind]["products"].length*15.5,
child:


new ListView.builder(
        itemCount: alldata[ind]["products"].length,
       
        itemBuilder: (BuildContext context, int index) {
         return
         
    Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[

Expanded(
flex: 4,
   child:Text(alldata[ind]["products"][index]["cus_name"],style: new TextStyle(fontSize: 18),textAlign: TextAlign.center,),
  
),Expanded(
flex: 2,
   child:Text(alldata[ind]["products"][index]["cus_price"].toString(),style: new TextStyle(fontSize: 18),textAlign: TextAlign.center,),
  
),Expanded(
flex: 1,
   child:Text(alldata[ind]["products"][index]["cus_qty"].toString(),style: new TextStyle(fontSize: 18),textAlign: TextAlign.center,),
  
),Expanded(
flex: 3,
   child:Text(alldata[ind]["products"][index]["cus_status"].toString(),style: new TextStyle(fontSize: 18),textAlign: TextAlign.center,),
  
),
  // Text("Price",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),),
  // Text("Qty",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),),
  // Text("Status",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.brown),),
],
);


        }),
 ),
 

  // new ListView.builder(
  //       itemCount: 4,
       
  //       itemBuilder: (BuildContext context, int index) {
  //        return Text("data");


  //       }),


  //  (lst.map(
  //       (data) {
        
       
  //         return Text("data");
            

  //       }
      
  //     ).toList(),
    



Padding(padding: EdgeInsets.all(10),)
],
 ),

// Align(alignment: Alignment.center,child: 


// )
                        
                              ],
                            ))))),
              ]));
            })
            
            
            
            );

    }



  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  Widget _status(status) {
    if(status == 'Cancel Order'){
     return FlatButton.icon(
          label: Text(status,style: TextStyle(color: Colors.red),),
          icon: const Icon(Icons.highlight_off, size: 18.0,color: Colors.red,),
          onPressed: () {
            // Perform some action
          }
      );
    }
    else{
     return FlatButton.icon(
          label: Text(status,style: TextStyle(color: Colors.green),),
          icon: const Icon(Icons.check_circle, size: 18.0,color: Colors.green,),
          onPressed: () {
            // Perform some action
          }
      );
    }
    if (status == "3") {
      return Text('Process');
    } else if (status == "1") {
      return Text('Order');
    } else {
      return Text("Waiting");
    }
  }
 erticalD() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );

  bool a = true;
  String mText = "Press to hide";
  double _lowerValue = 1.0;
  double _upperValue = 100.0;

  void _visibilitymethod() {
    setState(() {
      if (a) {
        a = false;
        mText = "Press to show";
      } else {
        a = true;
        mText = "Press to hide";
      }
    });
  }








}