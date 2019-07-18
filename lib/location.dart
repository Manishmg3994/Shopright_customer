import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'home.dart';
import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Location extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<Location> {
  List areas = new List();
String base_url = "";


_saveValues(pincode,area) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
 
    prefs.setString("pincode",pincode);
    prefs.setString("area",area);



  }

   @override
  void initState() {
   
CounterModel model = ScopedModel.of(context);
setState(() {
  base_url = model.url;
});

    super.initState();
  }

  @override



 void checkpin(context) async {

   setState(() {
    loading = true; 
   });
  try {
    Response response = await Dio().post(base_url+"customer/check_pincode",data: {
 "pincode" : pincode
 });
   
  //  print(response.data);
     if(response.data["status"])
    {

setState(() {
     loading=false;  area_field=true;
btn="Set Location";

     setState(() {
      areas= response.data["area"];
     });
    });
    }

    else{
 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Not Available for this Pincode"),
          // content: new Text("Try another number"),
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
      
setState(() {
     loading=false; 
     
    });


    }

    
  } catch (e) {
    print(e);
  }
}










var level =0;
 
  var loading=false;
  var mobile="";
  int area_select= 0;
  var area_changed= false;
  var width_x =false;
var pin_field=false;
var area_field =false;
var pincode="" ;

  var btn='check Pincode';
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[300],

        appBar: new AppBar(
        
        title:Text("Change Location"),
        

     



        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          )
        ),
     
      ),

      body: SafeArea(
        top: false,
        bottom: false,
      
          child: 
             new Center(

              
           child:   new ListView(
              children: <Widget>[

Padding(padding: EdgeInsets.all(55),),

   new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                        keyboardType: TextInputType.number,
                         onChanged:(data){ setState(() {
                      pincode= data.toString();
                     });
                                   
                                    
                                      
                     },

                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                           enabled: !area_field,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.gps_fixed),
                           hintText: "Pincode",
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  
                                    color: Color.fromRGBO(244, 92, 31, 1),
                                    
                                          width: 2)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      ),
                    )),
                    
                    
                   

          area_field?     new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        
                      ),
                      // child:   InputDecorator(
                      //   decoration: InputDecoration(
                      //     icon: const Icon(Icons.color_lens),
                      //   ),


                        child: new DropdownButtonHideUnderline(
                          
   child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: <Widget>[
//  Icon(Icons.gps_fixed),
       new Text("Select Area"),
 new DropdownButton<String>(
     value: area_changed? areas[area_select]:null,
                items: areas.map(( value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
  area_changed=true;

                        //  _color = newValue;

// print(areas.indexOf(newValue));
setState(() {
 area_select = areas.indexOf(newValue);
});
                },
              ),
     ],
   )
   
   
                       
                       
                       
                        )
                      )
                    ):


                    Padding(padding: EdgeInsets.all(1),),

                    new Padding(
                    // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    padding: EdgeInsets.only(top:12,left:30,right: 30,bottom: 10),
                    child: new Container(
                      // duration: Duration(seconds: 3),
                    //  width: 111.9,
                      child: new RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color.fromRGBO(244, 92, 31, 1),
                        onPressed: () {


if(area_field){

// print(pincode+areas[area_select]);
_saveValues(pincode, areas[area_select]);

                Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new AppHome()));

}

else{
                          checkpin(context);


}

                        },

                        child: loading?
                         SizedBox(
                child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.green[200],),strokeWidth: 3.0),
                height: 18.0,
                width: 18.0,
               
              ):
                        
                        
                         new Text(
                          btn,
                          style: TextStyle(color: Colors.white),
                        ),
                    
                    // )
                    
                      ),
                    )),
                    
                    
                   


              ],
            ),
            ),
          
        ),
      
    );
  }
}
