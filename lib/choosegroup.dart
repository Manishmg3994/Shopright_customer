import 'package:flutter/material.dart';
import 'groupview.dart';
import 'creategroup.dart';

import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:dio/dio.dart';
import 'package:toast/toast.dart';


import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';


class ChooseGroup extends StatefulWidget{

  @override
  _ChooseGroupState createState() => _ChooseGroupState();
}

class _ChooseGroupState extends State<ChooseGroup> {


String groupname='';

var loading = true;
var loading2 = false;
var nodata = false;
var choosed = false;

var groups =[];


  Response response;
List find = [];


List<bool> checkk =[];


void getData() async {
 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    // print(model.token);
    // print(model.pincode);
    // print(model.area);
 
 
     response = await dio.post(model.url+"api/choose_group",
     
     data: {
       "customer_id":model.myid,

       "product_id":model.productid
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

print(response.data);

setState(() {
 loading = false; 
});

if(response.data["status"]){

for(int i =0; i< response.data["result"].length;i++){


  checkk.add(false);
}

}

else{

 
 setState(() {
  nodata = true; 
 });
}

    
  } catch (e) {
    print(e);
  }
}










void addTo() async {
 
  
  try {
   
    
    CounterModel model = ScopedModel.of(context);

 
     response = await Dio().post(model.url+"api/add_to_group",
     
     data: {
       "customer_id":model.myid,
"group_id": groups,
       "product_id":model.productid,
       "qty":model.qty
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

print(response.data);

setState(() {
 loading2 = false; 
});

if(response.data["status"]){

                Navigator.of(context).pop();

                 Toast.show("Added Successfully",context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);


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
 
  void initState() {
  
   getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Choose Group"),),
      body:loading?SpinKitThreeBounce(
  color: Colors.pink,
  size: 50.0,
  
):nodata?Center(child:Text("No one Group Available...")): new Column(
        children: <Widget>[


       
          new Expanded(
            child: new ListView.builder
              (
                itemCount:response.data["result"].length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return 
                  
   Column(

children: <Widget>[


  Padding(padding: EdgeInsets.all(10),),

  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: <Widget>[


      Text("       "+response.data["result"][Index]["name"]),
 Checkbox(
                    value: checkk[Index],
                    onChanged: (bool value) {
                      
                          if(value){

                            setState(() {
                        groups.add(response.data["result"][Index]["_id"]);
                              
                            });


                      }
                      else{
setState(() {
                        groups.remove(response.data["result"][Index]["_id"]);
  
});

                      }

                      setState(() {
                       checkk[Index] =value;
                      });

                    }),

      // Padding(padding: EdgeInsets.only(left: 15),),r


    ],
  )
],


   );
                  
   
                }
            )
        ),
 
 
 
 
 
 
 










 
 
 
  new Padding(padding: EdgeInsets.all(1),),
new ButtonTheme(
minWidth: MediaQuery.of(context).size.width * 0.90,
  child:  new RaisedButton(
                      onPressed:!(groups.length>0)?null: loading2?(){}:() {



                       
                  
print(groups);
setState(() {
 loading2 = true; 
});
addTo();
                      
                      },
                      // padding: EdgeInsets.all(10),
                      child:

                      loading2?            SizedBox(
                child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.green[200],),strokeWidth: 3.0),
                height: 18.0,
                width: 18.0,
               
              ):
                      
                      new Text("Add to Group",style: TextStyle(fontSize: 20,)),
                      
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                    )
 ,
),
    



        ],
      )
    );
  }
}