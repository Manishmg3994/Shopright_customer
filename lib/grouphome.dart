import 'package:flutter/material.dart';
import 'groupview.dart';
import 'creategroup.dart';

import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:dio/dio.dart';
import 'package:toast/toast.dart';


import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';


class GroupHome extends StatefulWidget{

  @override
  _GroupHomeState createState() => _GroupHomeState();
}

class _GroupHomeState extends State<GroupHome> {
String groupname='';

var loading = true;
var nodata = false;


  Response response;
List find = [];
void getData() async {
 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    // print(model.token);
    // print(model.pincode);
    // print(model.area);
 
 
     response = await dio.post(model.url+"api/view_group",
     
     data: {
       "customer_id":model.myid
 
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

print(response.data);

setState(() {
 loading = false; 
});

if(response.data["status"]){

model.SetGroup(response.data["result"]);

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





 @override
 
  void initState() {
  
   getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Group Orders"),),
      body:loading?SpinKitThreeBounce(
  color: Colors.pink,
  size: 50.0,
  
):nodata?Center(child:Text("No one Group created yet now..")): new Column(
        children: <Widget>[

          
 ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return
       
          new Expanded(
            child: new ListView.builder
              (
                itemCount: model.group.length,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return 
                  
                  
                  Padding(padding: EdgeInsets.all(10),child: 

GestureDetector(

  onTap: (){

    model.setGroupid(model.group[Index]["_id"]);
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new GroupView()));




  },

  child:        GradientCard(
                                    shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.only(topRight: const Radius.circular(40.0),bottomRight: const Radius.circular(40.0),
                topLeft: const Radius.circular(40.0),bottomLeft: const Radius.circular(40.0),
                ),
              ),
                    
    gradient: Gradients.deepSpace,
    shadowColor: Gradients.coldLinear.colors.last.withOpacity(0.35),
    elevation: 8,

    child: Padding(padding: EdgeInsets.only(top:30,bottom: 25),child: GradientText(
  model.group[Index]["name"],
  shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
  gradient: Gradients.haze,
  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,),
  textAlign: TextAlign.center,
),),
)
                  
),




                         
                  );
                  
   
                }
            )
        );
              }),
  new Padding(padding: EdgeInsets.all(1),),
new ButtonTheme(
minWidth: MediaQuery.of(context).size.width * 0.90,
  child:  new RaisedButton(
                      onPressed: () {

                       
                   Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new CreateGroup()));


                      
                      },
                      // padding: EdgeInsets.all(10),
                      child:new Text("Create Group",style: TextStyle(fontSize: 20,)),
                      
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