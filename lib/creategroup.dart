import 'package:flutter/material.dart';
import 'groupview.dart';
import 'package:dio/dio.dart';
import 'package:toast/toast.dart';


import 'scopedmodel.dart';
import 'productview.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gradient_widgets/gradient_widgets.dart';


class CreateGroup extends StatefulWidget{

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
String groupname='';
bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
bool thuVal = false;
  bool friVal = false;
  bool satVal = false;
bool sunVal = false;
  bool mor = false;
  bool eve = false;

  var days = [];
var time = [];
var loading = false;


  Response response;
List find = [];


void getData() async {
 
   var dio = Dio();
  try {
   
    CounterModel model = ScopedModel.of(context);
   
 
 
     response = await dio.post(model.url+"api/view_group",
     
     data: {
       "customer_id":model.myid
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );


setState(() {
 loading = false; 
});

if(response.data["status"]){

model.SetGroup(response.data["result"]);
                Navigator.of(context).pop();


}

else{

 

}

    
  } catch (e) {
    print(e);
  }
}





void Create(context) async {
 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    // print(model.token);
    // print(model.pincode);
    // print(model.area);
 
 
     response = await dio.post(model.url+"api/create_group",
     
     data: {
       "customer_id":model.myid,
        "name":groupname,
         "frequent":days,
        "time":time
    
    
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

setState(() {
 loading = false; 
});

if(response.data["status"]){

getData();
                 Toast.show("Created Successfully",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);


}

else{

                                     showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Something wrong. Try again..."),
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
  
}

    
  } catch (e) {
    print(e);
  }
}




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Create Group"),
      centerTitle: true,),
      body: new  ListView(

         children: <Widget>[
Padding(padding: EdgeInsets.all(25),),

          Text("Group Name",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

Padding(padding: EdgeInsets.only(left: 20,right: 20),

child:  new TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: TextStyle(color:Colors.brown[700]),
              decoration: new InputDecoration(
                  // labelText: 'Group Name',
                  
                  //  hintText: 'eg. Juventus F.C.'
                  
                   
                   ),
              onChanged: (value) {
                groupname = value;
              },
            )

,),


 
Padding(padding: EdgeInsets.all(22),),

Text("Days",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

Padding(padding: EdgeInsets.all(7),),



 Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // [Monday] checkbox
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Mon"),
                  Checkbox(
                    value: monVal,
                    onChanged: (bool value) {
                      
                      if(value){

                        days.add(1);

                      }
                      else{


                        days.remove(1);
                      }


                      setState(() {
                        monVal = value;
                      });
                    },
                  ),
                ],
              ),
              // [Tuesday] checkbox
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Tue"),
                  Checkbox(
                    value: tuVal,
                    onChanged: (bool value) {

                       if(value){

                        days.add(2);

                      }
                      else{


                        days.remove(2);
                      }
                      setState(() {
                        tuVal = value;
                      });
                    },
                  ),
                ],
              ),
              // [Wednesday] checkbox
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Wed"),
                  Checkbox(
                    value: wedVal,
                    onChanged: (bool value) {

                       if(value){

                        days.add(3);

                      }
                      else{


                        days.remove(3);
                      }

                      setState(() {
                        wedVal = value;
                      });
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Thu"),
                  Checkbox(
                    value: thuVal,
                    onChanged: (bool value) {
 if(value){

                        days.add(4);

                      }
                      else{


                        days.remove(4);
                      }

                      setState(() {
                        thuVal = value;
                      });
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Fri"),
                  Checkbox(
                    value: friVal,
                    onChanged: (bool value) {

                       if(value){

                        days.add(5);

                      }
                      else{


                        days.remove(5);
                      }
                      setState(() {
                        friVal = value;
                      });
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sat"),
                  Checkbox(
                    value: satVal,
                    onChanged: (bool value) {

                       if(value){

                        days.add(6);

                      }
                      else{


                        days.remove(6);
                      }
                      setState(() {
                        satVal = value;
                      });
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sun"),
                  Checkbox(
                    value: sunVal,
                    onChanged: (bool value) {
                       if(value){

                        days.add(7);

                      }
                      else{


                        days.remove(7);
                      }
                      setState(() {
                        sunVal = value;
                      });
                    },
                  ),
                ],
              ),
            
            
            
            
            ],
          ),
        



Padding(padding: EdgeInsets.all(15),),

Text("Time",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

Padding(padding: EdgeInsets.all(7),),



 Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // [Monday] checkbox
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Morning"),
                  Checkbox(
                    value: mor,
                    onChanged: (bool value) {
                      if(value){

                        time.add(1);

                      }
                      else{


                        time.remove(1);
                      }
                      setState(() {
                        mor = value;
                      });
                    },
                  ),
                ],
              ),
              // [Tuesday] checkbox
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Evening"),
                  Checkbox(
                    value: eve,
                    onChanged: (bool value) {

                       if(value){

                        time.add(2);

                      }
                      else{


                        time.remove(2);
                      }
                      setState(() {
                        eve = value;
                      });
                    },
                  ),
                ],
              ),
              // [Wednesday] checkbox
           ],
          ),
        
















Padding(padding: EdgeInsets.all(10),
),

Padding(padding: EdgeInsets.only(right: 50,left: 50,top:10,bottom: 10),

child: ButtonTheme(
  minWidth: 11.0,
  buttonColor: Colors.green[600],
  // height: 100.0,
             child: RaisedButton(
                
            child:loading?            SizedBox(
                child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.green[200],),strokeWidth: 3.0),
                height: 18.0,
                width: 18.0,
               
              ): Text('Create',style: new TextStyle(color: Colors.white),),

            onPressed:loading?null: () {

              if(groupname.length>0){





                    if(monVal || tuVal || wedVal || thuVal || friVal || satVal || sunVal){






                      if(mor || eve){




print(groupname);
print(days);

setState(() {
 loading = true; 
});


Create(context);

                      }


                      else{

                                    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Please choose atleast one Time"),
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
  
                      }




                    }

                    else{

                                  showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Please Choose atleast one Day"),
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
  
                    }




              }


              else{



                showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Please Enter Valid Groupname"),
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
  
              }




            },
          ),

    )    
 
),
             
   ],             
  
        ),
     
     
      
    );
  }
}