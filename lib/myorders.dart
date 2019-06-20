import 'package:flutter/material.dart';


class MyOrders extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return MyOrdersState();
    }
}

class MyOrdersState extends State<MyOrders> {


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
            itemCount: 3,
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
                                   name[ind],
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
                                    'To Deliver On :' +
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
                                                '45.79',
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
                                                'COD',
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
                                    Text('First Street, mettur,636451',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black54)),
                                  ],
                                ),
                              //    Padding(padding: EdgeInsets.all(10),
                                
                                
                              //  child: Divider(
                              //     height: 10.0,
                              //     color: Colors.redAccent,
                              //   ),
                              //   ),
                                Container(
                                 child:_status(order[ind])
                                ),

 new ExpansionTile(

                  title: new Text("View Products"),

children: <Widget>[
        Table(
                                   border: TableBorder.all(width: 0.2, color: Colors.grey),
                                  
                                  children: [

                                    
                          
  TableRow(
  
    children: [
    Text("Name",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.brown),textAlign: TextAlign.center,),

        Text("qty",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.brown),textAlign: TextAlign.center,),
    Text("MRP.",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.brown),textAlign: TextAlign.center,),
    Text("off.",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.brown),textAlign: TextAlign.center,),

  ]),
  TableRow(children:[
     Text("apple",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("3",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("67",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("20%",style: new TextStyle(),textAlign: TextAlign.center,),
  ]), 

   TableRow(children:[
     Text("apple",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("3",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("67",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("20%",style: new TextStyle(),textAlign: TextAlign.center,),
  ]),  TableRow(children:[
     Text("apple",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("3",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("67",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("20%",style: new TextStyle(),textAlign: TextAlign.center,),
  ]),  TableRow(children:[
     Text("apple",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("3",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("67",style: new TextStyle(),textAlign: TextAlign.center,),
    Text("20%",style: new TextStyle(),textAlign: TextAlign.center,),
  ]), 
]),

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