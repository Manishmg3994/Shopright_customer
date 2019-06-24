import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class ConfirmOrderPage extends StatelessWidget{
  final String address = "Chabahil, Kathmandu";
  final String phone="9818522122";
  final double total = 500;
  final double delivery = 0.00;
TextEditingController _controller1 = new TextEditingController();
TextEditingController _controller2 = new TextEditingController();
TextEditingController _controller3 = new TextEditingController();
TextEditingController _controller4 = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    _controller1.text='Dinesh Kumar';
    _controller2.text='9876553534';
    _controller3.text='17/1-170B';
    _controller4.text='Near bus stand';
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Subtotal"),
                  Text("Rs. $total"),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Delivery fee"),
                  Text("Rs. $delivery"),
                ],
              ),
              SizedBox(height: 10.0,),  
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Total", style: Theme.of(context).textTheme.title,),
                  Text("Rs. ${total+delivery}", style: Theme.of(context).textTheme.title),
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

TextFormField(
  
  decoration: InputDecoration(
    labelText: 'Name',

  
    
  ),
  controller: _controller1,



  // initialValue: 'Dinesh Kumar',
  
),TextFormField(

  
  decoration: InputDecoration(
    labelText: 'Mobile',

    
    
  ),
// initialValue: '9998767854',
  controller: _controller2,
),TextFormField(
  
  decoration: InputDecoration(
    labelText: 'Door No.',
    
  ),
  controller: _controller3,

),TextFormField(
  
  decoration: InputDecoration(
    labelText: 'Landmark',
    
  ),
  controller: _controller4,

),


       new Row(
mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
Padding(padding: EdgeInsets.only(top: 15),

child: new Row(children: <Widget>[
 Icon(Icons.place,size: 20,
 color: Colors.grey[600],
 ),
Padding(padding: EdgeInsets.all(1),),
            Text('636452',style: new TextStyle(fontSize: 15,color: Colors.black,),)
         
            ,Text(' - First Zone ', overflow: TextOverflow.ellipsis,
    maxLines: 1,style: new TextStyle(color: Colors.brown),),


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
    "Paypal"
  ],
  onSelected: (String selected) => print(selected),
  padding: EdgeInsets.all(2),
  labelStyle: new TextStyle(fontWeight: FontWeight.bold),
),
             Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: ()=> {print(_controller1.text+' '+_controller2.text+' '+_controller3.text+' '+_controller4.text+' ')},
                  child: Text("Confirm Order", style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              )
            ],
          ),
        );
  }

  
}