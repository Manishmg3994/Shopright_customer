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
  bool load_status =false;
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
bool thuVal = false;
  bool friVal = false;
  bool satVal = false;
bool sunVal = false;
  bool mor = false;
  bool eve = false;
var status = false;
  var days = [];
var time = [];
var loading = true;
var nodata = true;

var daysValue = [];
var timeValue = [];


var daysLoading = [false,false,false,false,false,false,false,];
var timeLoading = [false,false,false,false,false,false,false,];
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


if(response.data["result"].length==0 || response.data["result"][0]["product"].length==0   ){




}

else{

setState(() {
daysValue = response.data["result"][0]["_id"]["days"];
timeValue = response.data["result"][0]["_id"]["time"];
 status = response.data["result"][0]["_id"]["status"];
 nodata = false; 

});

  model.SetGroupProduct(response.data["result"][0]["product"]);
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







void incr( pro_id,index) async {

 
 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    

print(pro_id);

print(model.myid);

print(model.groupProduct);

     response = await dio.post(model.url+"api/group_qty_add",
     
     data: {
       "customer_id":model.myid,

        "product_id":pro_id,
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

print(response.data);



if(response.data["status"]){

setState(() {
 model.groupProduct[index]["qty"] =  model.groupProduct[index]["qty"]+1;
});
}

else{

                 Toast.show("Something wrong",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}






    
  } catch (e) {
    print(e);
  }
}







void decr(product_id,index) async {

 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    // print(model.token);
    // print(model.pincode);
    // print(model.area);
 
 
     response = await dio.post(model.url+"api/group_qty_minus",
     
     data: {
       "customer_id":model.myid,

      "product_id":product_id,
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

print(response.data);





if(response.data["status"]){

setState(() {
 model.groupProduct[index]["qty"] =  model.groupProduct[index]["qty"]-1;
});
}

else{

                 Toast.show("Something wrong",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}




    
  } catch (e) {
    print(e);
  }
}







void remove(product_id) async {
 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    // print(model.token);
    // print(model.pincode);
    // print(model.area);
 
 
     response = await dio.post(model.url+"api/remove_product",
     
     data: {
       "customer_id":model.myid,
  "group_id":model.groupid,
      "product_id":product_id,
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

print(response.data);





if(response.data["status"]){


model.RemoveGroupProduct(product_id);


}

else{

                 Toast.show("Something wrong",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}




    
  } catch (e) {
    print(e);
  }
}






void delete() async {
 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    // print(model.token);
    // print(model.pincode);
    // print(model.area);
 
 
     response = await dio.post(model.url+"api/delete_group",
     
     data: {
       "customer_id":model.myid,
  "group_id":model.groupid
    
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

print(response.data);





if(response.data["status"]){


goHome();


}

else{

                 Toast.show("Something wrong",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

}




    
  } catch (e) {
    print(e);
  }
}





void goHome() async {
 
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



void setStatus(state) async {
 
   var dio = Dio();
  try {
   
    CounterModel model = ScopedModel.of(context);
   
 
 
     response = await dio.post(model.url+"api/block_group",
     
     data: {
       "customer_id":model.myid,
    "group_id":model.groupid,
    "status":state,
    
    }
    ,options: Options(headers: {"Authorization": model.token})
    );


// print(response.data);

if(response.data["status"]){

setState(() {
 status = state; 
 load_status= false;
});


}

else{

                 Toast.show("Operation failed",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
 

}

    
  } catch (e) {
    print(e);
  }
}






void changeTime(fre,pos,state) async {
 
   var dio = Dio();
  try {
   
    CounterModel model = ScopedModel.of(context);
   
 
 
     response = await dio.post(model.url+"api/frequent_change",
     
     data: {
       "customer_id":model.myid,
    "group_id":model.groupid,
    "status":{fre+"."+pos:state},
    
    }
    ,options: Options(headers: {"Authorization": model.token})
    );


// print(response.data);

if(response.data["status"]){

  if(fre == "frequent"){

setState(() {
 daysLoading[int.parse(pos)]= false;
 timeLoading[int.parse(pos)]= false;

 daysValue[int.parse(pos)] =state;
});

  }


  else{

setState(() {
 daysLoading[int.parse(pos)]= false;
 timeLoading[int.parse(pos)]= false;

 timeValue[int.parse(pos)] =state;
});

  }




}

else{

                 Toast.show("Operation failed",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
 

}

    
  } catch (e) {
    print(e);
  }
}






  @override
  void initState() {
    getData();
   
    super.initState();
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
color:Colors.blue[600],
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
      child:       new Text('View/Edit Info',style: new TextStyle(fontSize: 25,color: Colors.black87),),
  
),

  
           
nodata ? Padding(padding: EdgeInsets.all(10)):Padding(padding: EdgeInsets.all(10),),

nodata ? Padding(padding: EdgeInsets.all(10)):new Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[


Text("Status",style: new TextStyle(fontSize: 18,color: Colors.yellowAccent[700],fontWeight: FontWeight.bold)),



load_status?SpinKitThreeBounce(
  color: Colors.white,
  size: 20.0,
  
):

Switch(
  value: status,
  onChanged: (value) {
    setState(() {
      load_status = true;
    });

    setStatus(value);
  },
  activeTrackColor: Colors.pink[200], 
  activeColor: Colors.pink[700],
),
 
],


),



nodata ? Padding(padding: EdgeInsets.all(10)):Padding(padding: EdgeInsets.all(5),),

(nodata || !status ) ? Padding(padding: EdgeInsets.all(10)):Text("Days",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.yellowAccent[700]),textAlign: TextAlign.center,),

(nodata || !status ) ? Padding(padding: EdgeInsets.all(1)):Padding(padding: EdgeInsets.all(7),),

(nodata || !status ) ? Padding(padding: EdgeInsets.all(1)): Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // [Monday] checkbox
                                                     daysLoading[0]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):    Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Mon",style: TextStyle(color: Colors.white), ),
     Checkbox(
                    value: daysValue[0],
                    onChanged: (bool value) {
                      
                     

                     changeTime("frequent","0",value);


                      setState(() {
                        daysLoading[0] = true;
                      });
                    },
                  ),
                ],
              ),
              // [Tuesday] checkbox
                                                  daysLoading[1]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):        Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Tue",style: TextStyle(color: Colors.white),),
    Checkbox(
                    value: daysValue[1],
                    onChanged: (bool value) {
                     changeTime("frequent","1",value);

                    
                      setState(() {
                        daysLoading[1] = true;
                      });
                    },
                  ),
                ],
              ),
              // [Wednesday] checkbox
                                                     daysLoading[2]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):      Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Wed",style: TextStyle(color: Colors.white),),
   Checkbox(
                    value: daysValue[2],
                    onChanged: (bool value) {

                                        changeTime("frequent","2",value);

                    
                      setState(() {
                        daysLoading[2] = true;
                      });
                    },
                  ),
                ],
              ),
                                                      daysLoading[3]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):    Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Thu",style: TextStyle(color: Colors.white),),
    Checkbox(
                    value: daysValue[3],
                    onChanged: (bool value) {
 
                     changeTime("frequent","3",value);

                    
                      setState(() {
                        daysLoading[3] = true;
                      });
                    },
                  ),
                ],
              ),
                                                     daysLoading[4]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):    Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Fri",style: TextStyle(color: Colors.white),),
     Checkbox(
                    value: daysValue[4],
                    onChanged: (bool value) {

                   
                                          changeTime("frequent","4",value);

                    
                      setState(() {
                        daysLoading[4] = true;
                      });
                    },
                  ),
                ],
              ),
                                                    daysLoading[5]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):      Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sat",style: TextStyle(color: Colors.white),),
    Checkbox(
                    value: daysValue[5],
                    onChanged: (bool value) {

                       
                                           changeTime("frequent","5",value);

                    
                      setState(() {
                        daysLoading[5] = true;
                      });
                    },
                  ),
                ],
              ),
                                       daysLoading[6]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):      Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Sun",style: TextStyle(color: Colors.white),),
   Checkbox(
                    value: daysValue[6],
                    onChanged: (bool value) {
                      
                                          changeTime("frequent","6",value);

                    
                      setState(() {
                        daysLoading[6] = true;
                      });
                    },
                  ),
                ],
              ),
            
            
            
            
            ],
          ),
        

(nodata || !status ) ? Padding(padding: EdgeInsets.all(1)):Padding(padding: EdgeInsets.all(10),),

(nodata || !status ) ? Padding(padding: EdgeInsets.all(1)):Text("Time",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.yellowAccent[700]),textAlign: TextAlign.center,),

(nodata || !status ) ? Padding(padding: EdgeInsets.all(1)):Padding(padding: EdgeInsets.all(5),),



 (nodata || !status ) ? Padding(padding: EdgeInsets.all(1)):Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // [Monday] checkbox
            
                  timeLoading[0]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Morning",style: TextStyle(color: Colors.white),),
                  

                  Checkbox(
                    value: timeValue[0],
                    onChanged: (bool value) {
                    
                                          changeTime("time","0",value);

                    
                      setState(() {
                        timeLoading[0] = true;
                      });
                    },
                  ),
                ],
              ),
              // [Tuesday] checkbox
                                      timeLoading[1]?SpinKitDoubleBounce(
  color: Colors.white,
  size: 25.0,
  
):  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Evening",style: TextStyle(color: Colors.white),),
         Checkbox(
                    value: timeValue[1],
                    onChanged: (bool value) {

                    
                                          changeTime("time","1",value);

                    
                      setState(() {
                        timeLoading[1] = true;
                      });
                    },
                  ),
                ],
              ),
              // [Wednesday] checkbox
           ],
          ),
        

(nodata || !status ) ? Padding(padding: EdgeInsets.all(1)):Padding(padding: EdgeInsets.all(10),),










 Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

  RaisedButton(
color: Colors.red[400],
 shape: new RoundedRectangleBorder(
         borderRadius: new BorderRadius.circular(10.0)),
        onPressed: (){
                                     showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Want to Delete this Group?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Yes"),
              onPressed: () {
          delete();

                Navigator.of(context).pop();
              },
            ), new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
 
        },

        child: Text("Delete Group",textAlign: TextAlign.center,style: new TextStyle(fontSize: 18,color: Colors.white),),
      ),


      ],
          ),
   
















       ],

        )
      ),




      body:nodata?Center(child:Text("No one product added yet now")):
      new Column(

        children: <Widget>[
  
            
 ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {

                if(model.groupProduct.length ==0){

                  setState(() {
                   nodata =true; 
                  });
                }
                return
       

 new Expanded(
  child:new ListView.builder(
        itemCount: model.groupProduct.length,
       
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
child: Image.network(model.groupProduct[index]["img_url"],
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

  child: new Text(model.groupProduct[index]["name"], overflow: TextOverflow.ellipsis,style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    maxLines: 2,),
),





Padding(padding: EdgeInsets.only(top:18,right: 10),

child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[


    Text(model.groupProduct[index]["price"].toString()),

    Text(model.groupProduct[index]["unit"])
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
shape: new RoundedRectangleBorder(
         borderRadius: new BorderRadius.circular(100.0)),
    onPressed: (){


if(model.groupProduct[index]["qty"] >9){


                 Toast.show("Maximum Qty :10",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);


}

else{
      incr(model.groupProduct[index]["product_id"],index);


}
    },


        child: Text('+',textAlign: TextAlign.center,style: new TextStyle(fontSize: 25,color: Colors.white),),
      ),
),


Padding(padding: EdgeInsets.only(left: 15,right: 15),
child: Text(model.groupProduct[index]["qty"].toString(),style: new TextStyle(fontSize: 15),),),

     SizedBox(
  width: 50, // specific value
  child: RaisedButton(
color: Colors.blue,
shape: new RoundedRectangleBorder(
         borderRadius: new BorderRadius.circular(100.0)),
     onPressed: (){



if(model.groupProduct[index]["qty"] >1){

      decr(model.groupProduct[index]["product_id"],index);


}



    },

        child: Text('-',textAlign: TextAlign.center,style: new TextStyle(fontSize: 35,color: Colors.white),),
      ),
),




    ],
  ),




RaisedButton(
   shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                
              ),
  color: Colors.red[400],
  onPressed: (){

remove(model.groupProduct[index]["product_id"]);

  },

child:Text("Remove",style: new TextStyle(color:Colors.white),))

  ],
),

 
],







),






              
            ),

  ],
);
 
                   
        }),

 );


              })



















        
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