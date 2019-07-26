import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'search.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:dio/dio.dart';
import 'package:toast/toast.dart';


import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';


class GroupView extends StatefulWidget{
  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
PanelController _pc = new PanelController();

 List _fruits = ['Active','InActive'];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

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
var loading = true;
var nodata = false;
  Response response;





void getData() async {
 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    // print(model.token);
    // print(model.pincode);
    // print(model.area);
 
 
     response = await dio.post(model.url+"api/group_product",
     
     data: {
       "customer_id":model.myid,

       "group_id":model.groupid
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

print(response.data);

setState(() {
 loading = false; 
});

if(response.data["status"]){


if(response.data["result"].length==0){


setState(() {
 nodata = true; 
});

}


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
  void initState() {
    getData();
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);

    _selectedFruit = _dropDownMenuItems[1].value;

    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = new List();
    for (String fruit in fruits) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit,style: new TextStyle(fontSize: 18,color: Colors.brown),)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }
var open =false;
@override
Widget build(BuildContext context) {
  return Scaffold(


    appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),

          
          child: AppBar(

            
      backgroundColor: Colors.green[200],
       actions: <Widget>[
       
        new IconButton(icon: new Icon(Icons.add,color: Colors.pink,),
              onPressed: (){

              
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SearchView()));

              },
              ),  new IconButton(icon: new Icon(Icons.edit,color: Colors.blue,),
              onPressed: (){

              _pc.open();
                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SearchView()));

              },
              ),
              
              
              
              
              ],
      title: Text("Group Products",style: TextStyle(fontSize: 25,color: Colors.black87,fontWeight: FontWeight.bold),),
      // centerTitle: true,
     elevation: 0.0,
    ), 
    ),
    
    
    
    backgroundColor: Colors.grey[300],




    body:loading?SpinKitThreeBounce(
  color: Colors.pink,
  size: 50.0,
  
): SlidingUpPanel(
minHeight:44,
maxHeight: MediaQuery.of(context).size.height-185,
color:Colors.green[200],
// border: Border.all(color:Colors.black, width: 2),
      backdropColor: null,
borderRadius: BorderRadius.only(topRight: Radius.circular(100),topLeft: Radius.circular(100),),
controller: _pc,
// onPanelClosed:(){
// setState(() {
//  open = !open; 
// });

// },
      panel:SingleChildScrollView(

        child: Column(
        children: <Widget>[
Padding(padding: EdgeInsets.all(6),),

GestureDetector(

onTap: (){

   setState(() {
      open = !open; 

      if(open){

_pc.open();

      }

      else{

        _pc.close();
      }
     });



},
      child:       new Text('View/Edit Info',style: new TextStyle(fontSize: 25,color: Colors.grey[900]),),
  
),
           
Padding(padding: EdgeInsets.all(10),),

new Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[


Text("Status",style: new TextStyle(fontSize: 18),),
new DropdownButton(
    
                value: _selectedFruit,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
                
              ),
 
],


),



 
Padding(padding: EdgeInsets.all(5),),

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
        



Padding(padding: EdgeInsets.all(10),),

Text("Time",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

Padding(padding: EdgeInsets.all(5),),



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
        

       ],

        )
      ),




      body:nodata?Center(child:Text("No one product added yet now")):
      new Column(

        children: <Widget>[
         
  

 new Expanded(
  child:new ListView.builder(
        itemCount: response.data["result"].length,
       
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
child: Image.network(response.data["result"][index]["img_url"],
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

  child: new Text(response.data["result"][index]["name"], overflow: TextOverflow.ellipsis,style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    maxLines: 2,),
),





Padding(padding: EdgeInsets.only(top:18,right: 10),

child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[


    Text(response.data["result"][index]["price"].toString()),

    Text(response.data["result"][index]["unit"])
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




new Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[

 Row(

mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
 


      SizedBox(
  width: 50, // specific value
  child: RaisedButton(
color: Colors.green,

    


        child: Text('+',textAlign: TextAlign.center,style: new TextStyle(fontSize: 25,color: Colors.white),),
      ),
),


Padding(padding: EdgeInsets.only(left: 15,right: 15),
child: Text(response.data["result"][index]["qty"].toString(),style: new TextStyle(fontSize: 15),),),

     SizedBox(
  width: 50, // specific value
  child: RaisedButton(
color: Colors.red,
    

        child: Text('-',textAlign: TextAlign.center,style: new TextStyle(fontSize: 35,color: Colors.white),),
      ),
),




    ],
  ),




RaisedButton(onPressed: null,

child:Text("Remove"))

  ],
),

 
],







),





















              
            ),

  ],
);
 
                   
        }),

 ),


        
        ],
      ),
      
      
    
    ),
  
//   floatingActionButton: new FloatingActionButton(
//       elevation: 0.0,
     
//       child: new Icon(Icons.edit),
//       backgroundColor:Colors.green[700],
//       onPressed: (){


//         setState(() {
//       open = !open; 

//       if(open){

// _pc.open();

//       }

//       else{

//         _pc.close();
//       }
//      });
//       }
//     ),
 
  
  );

 

}
}