import 'package:flutter/material.dart';

import 'package:gradient_widgets/gradient_widgets.dart';


class GroupHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Group Orders"),),
      body: new Column(
        children: <Widget>[
       
          new Expanded(
            child: new ListView.builder
              (
                itemCount: 7,
                itemBuilder: (BuildContext ctxt, int Index) {
                  return 
                  
                  
                  Padding(padding: EdgeInsets.all(10),child: 
                                 GradientCard(
                                    shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.only(topLeft: const Radius.circular(40.0),bottomRight: const Radius.circular(40.0),),
              ),
                    
    gradient: Gradients.taitanum,
    shadowColor: Gradients.coldLinear.colors.last.withOpacity(0.25),
    elevation: 8,

    child: Padding(padding: EdgeInsets.only(top:30,bottom: 25),child: GradientText(
  'Group $Index',
  shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
  gradient: Gradients.haze,
  style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,),
  textAlign: TextAlign.center,
),),
)
                  
                  ,);
                  
   
                }
            )
        ),
  
  new Padding(padding: EdgeInsets.all(1),),
new ButtonTheme(
minWidth: MediaQuery.of(context).size.width * 0.90,
  child:  new RaisedButton(
                      onPressed: () {
                  //       Navigator.of(context).pop();
                  //  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ConfirmOrderPage()));


                      
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