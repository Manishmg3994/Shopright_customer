import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'search.dart';
// import 'package:provider/provider.dart';
import 'testing.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scopedmodel.dart';
import 'grouphome.dart';
import 'groupview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
/// This is the main method of app, from here execution starts.
void main() => runApp(App());

/// App widget class





class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}


class _AppState extends State<App> {
getSharedPreferences() async {
// CounterModel model = ScopedModel.of(context);

    SharedPreferences prefs = await SharedPreferences.getInstance();
  //  print(prefs.getBool("islogin"));
  //   print("token " +prefs.getString("token"));
  //   print("myid "+prefs.getString("myid"));
  //   print("myname "+prefs.getString("myname"));
  //   print("mobile "+prefs.getString("mobile"));
  //   print("pincode "+prefs.getString("pincode"));
  //   print("area "+prefs.getString("area"));
if(prefs.getBool("islogin")==null || prefs.getBool("islogin")==false){
// model.setLogin(false);
setState(() {
 status=false; 
});
}

else{
// model.setLogin(prefs.getBool("islogin"));

// print('hjcfjr');
setState(() {
 status=true; 
});
}
   
  }

  var status=false;
  @override
 
  void initState() {
  // now I can do with the model whatever I need to do:
  // Text someVar = model.initialText;
  
    getSharedPreferences();
    super.initState();
  }


 
  @override
  Widget build(BuildContext context) {
// CounterModel model = ScopedModel.of(context);

  return ScopedModel<CounterModel>(
      model: CounterModel(),
      child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopRight', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
     
        fontFamily: 'JosefinSans',
      
      ), 
 home:status?new AppHome(): new Intro()
      ),

    );
  }
}

class Intro extends StatelessWidget {
 @override
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/sr_logo.png'),
        body: Text(
          'hi this shopright - ecommerce app',
        ),
       title: Text(''),
        textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/sr_logo.png',
          height: 200.0,
          width: 200.0,
          alignment: Alignment.center,
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/sr_logo.png',
      body: Text(
        'you can order vegetables, fruits, grocery products from your home',
      ),
     title: Text(''),
      mainImage: Image.asset(
        'assets/sr_logo.png',
        height: 250.0,
        width:250.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'assets/sr_logo.png',
      body: Text(
        'get amazing offers and cashback on every orders',
      ),
     title: Text(''),
      mainImage: Image.asset(
        'assets/sr_logo.png',
        height: 300.0,
        width: 300.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  Widget build(BuildContext context) {
 return Scaffold(


    body:  Builder(
        
        builder: (context) => IntroViewsFlutter(
         
              pages,
            showSkipButton:false, 
            doneText:Text("Go Shop"),
              onTapDoneButton: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ), //MaterialPageRoute
                );
              },
              pageButtonTextStyles: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ), //IntroViewsFlutter
      ),
  );
  }}
















class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var mobile ="";
  var pass ="";
  String base_url = "";
  var loading = false;

  @override
  void initState() {
   
CounterModel model = ScopedModel.of(context);
setState(() {
  base_url = model.url;
});

    super.initState();
  }

_saveValues(io,token,myid,myname,mobile,pincode,area,door,adr1,adr2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("islogin",io);
    prefs.setString("token",token);
    prefs.setString("myid",myid);
    prefs.setString("myname",myname);
    prefs.setString("mobile",mobile);
    prefs.setString("pincode",pincode);
    prefs.setString("area",area);
    prefs.setString("door",door);
    prefs.setString("adr1",adr1);
    prefs.setString("adr2",adr2);



  }

void login(context) async {
  try {
    Response response = await Dio().post(base_url+"customer/login",data: {"mobile" : mobile,
    "password":pass
    
    });
    print(response.data);
    




    if(response.data["status"])
    {
    // print(response.data["result"]["name"]);
_saveValues(true,response.data["token"],response.data["result"]["_id"],response.data["result"]["name"]
,response.data["result"]["mobile"],response.data["result"]["pincode"],response.data["result"]["area"],response.data["result"]["door"]
,response.data["result"]["adr1"],response.data["result"]["adr2"]
);
                Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new AppHome()));


setState(() {
     loading=false;
     



    });
   }

    else{

      setState(() {
     loading=false; 
   });
 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Incorrect Mobile/Password"),
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
      



    }
    
  } catch (e) {
    print(e);
  }
}



 @override
  Widget build(BuildContext context) {
// CounterModel model = ScopedModel.of(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(85, 102, 81,10),
    ));
    return new Scaffold(
        backgroundColor: Color.fromRGBO(172, 255, 155,10),
        
        body: SafeArea(
            top: false,
            bottom: false,
            
            child: new Center(

              
           child:   new ListView(
              children: <Widget>[



Padding(

  padding: EdgeInsets.only(top:50),
),
 new Image.asset("assets/sr_logo.png",height: 100,width: 100,),


                new Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 5),
                    child: new Card(
                      elevation: 4.0,
                    
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                        onChanged: (data){
                          setState(() {
                           mobile=data; 
                          });

                        },
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.phone),
                            hintText: 'Mobile No',
                            // labelText: 'Email',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      ),
                    )),





                new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
obscureText:true,

                          onChanged: (data){
                          setState(() {
                           pass=data; 
                          });

                        },
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.vpn_key),
                            hintText: 'Password',
                            // labelText: 'Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      ),
                    )),
                new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: new FlatButton(
                      // onPressed: () => (),
                      child: new Align(
                        alignment: Alignment.centerRight,
                        child: new Text(
                          "Forgot Password?",
                          textAlign: TextAlign.right,
                        ),
                      ),
                    )),
                new Padding(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                    child: new Container(
                      padding: EdgeInsets.only(),
                      child: new RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color.fromRGBO(244, 92, 31, 1),
                        onPressed: (){

                          if(mobile.length>=10 && pass.length>=6){

                      setState(() {
                          loading=true; 
                          });
                          login(context);

                          }

else{

 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please enter valid Mobile/Password"),
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



}
                              // _saveValues(true);

                // Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new AppHome()));

                        },
                        child:loading?
                         SizedBox(
                child: CircularProgressIndicator( valueColor: new AlwaysStoppedAnimation<Color>(Colors.green[200],),strokeWidth: 3.0),
                height: 18.0,
                width: 18.0,
               
              ):
                 new Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("Don't have an Account?"),
                    new FlatButton(
                      onPressed: () =>
                         Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ), //MaterialPageRoute
                ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Color.fromRGBO(244, 92, 31, 1)),
                      ),
                    )
                  ],
                ),
              ],
           )
            )));
  }
}





//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////




class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<Register> {
  List areas = new List();
String base_url = "";

   @override
  void initState() {
   
CounterModel model = ScopedModel.of(context);
setState(() {
  base_url = model.url;
});

    super.initState();
  }

  @override

void checkno(context) async {
  try {
    Response response = await Dio().post(base_url+"customer/check_mobile",data: {"mobile" : mobile});
    print(response.data);
    print(mobile);

    if(response.data["status"])
    {

setState(() {
     loading=false;  show_otp=true;
mobile_otp=response.data["otp"].toString();
mobile_enable=false;level=1;
    });
    }

    else{
 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Number Already Exist"),
          content: new Text("Try another number"),
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
      // mobile_check=true;
// mobile="";
    });


    }
    
  } catch (e) {
    print(e);
  }
}



 void checkpin(context) async {
  try {
    Response response = await Dio().post(base_url+"customer/check_pincode",data: {
 "pincode" : pincode
 });
   
   print(response.data);
     if(response.data["status"])
    {

setState(() {
     loading=false;  area_field=true;
level=3;
btn="Register";

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





 void create_account(context) async {

  try {
    Response response = await Dio().post(base_url+"customer/register",data: {
 "mobile":mobile,
"pincode": pincode,
"area":areas[area_select],
"name":name,
"password":pass,
 "mail":"no mail",
 "door":door,
 "adr1":adr1,
 "adr2":adr2+".",
 });
   
   print(response.data);
   setState(() {
    loading=false;
   });
     if(response.data["status"])
    {
 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("congratulations...",style: new TextStyle(),
          // textAlign: TextAlign.center,
          ),
          content: new Text("Your Account created successfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Login"),
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

    else{
 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Something Wrong..."),
          content: new Text("Try again"),
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










var door = "";
var adr1 = "";
var adr2 = " ";
var level =0;
  var show_otp=false,
  mobile_otp="";
 bool mobile_enable=true;
  var loading=false;
  var mobile="";
  var enter_otp="";
  int area_select= 0;
  var area_changed= false;
  var width_x =false;
var pin_field=false;
var area_field =false;
var pincode="" ;
var name = "";
var pass ="";
var con_pass ="";
var mail="";
  var btn='Get OTP';
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(173, 180, 255,3),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          child: 
             new Center(

              
           child:   new ListView(
              children: <Widget>[

Padding ( padding: EdgeInsets.only(top:50),),
 new Image.asset("assets/sr_logo.png",height: 100,width: 100,),
Padding(padding: EdgeInsets.only(right:  MediaQuery.of(context).size.width * 0.22),

child:Text(mobile_otp,style: new TextStyle(),textAlign: TextAlign.right,),
 ),
  new Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 5),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: new TextField(
                                    keyboardType: TextInputType.number,

                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.phone),
                           enabled: mobile_enable,
                            hintText: 'Mobile No.',
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(244, 92, 31, 1),
                                   width: 2
                                    )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                     onChanged:(data){ setState(() {
                      mobile= data.toString();
                     });
                     }
                      ),
                    )),


           show_otp ?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                         keyboardType: TextInputType.number,
                         onChanged:(data){ setState(() {
                      enter_otp= data.toString();
                     });                  
                     },
                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.message),
                           enabled: !pin_field,

                           hintText: "OTP",
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
                    ))
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),
               




           pin_field?    new Padding(
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
                    ))
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),

            area_field?    new Padding(
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
                    )
                    
                    // )
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),



      area_field?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                        // keyboardType: TextInputType.number,
                         onChanged:(data){ setState(() {
                      name= data.toString();
                     });
                                   
                                    
                                      
                     },

                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.person),
                           hintText: "Name",
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
                    ))
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),

                          area_field?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                        // keyboardType: TextInputType.number,
                         onChanged:(data){ setState(() {
                      pass= data.toString();
                     });
                                   
                                    
                                      
                     },
obscureText:true,
                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.vpn_key),
                           hintText: "Password",
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
                    ))
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),

                          area_field?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                        // keyboardType: TextInputType.number,
                         onChanged:(data){ setState(() {
                     con_pass =data;
                     });
                                   
                                    
                                      
                     },
obscureText:true,

                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.vpn_key),
                           hintText: "Conform Password",
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
                    ))
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),



               area_field?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                        // keyboardType: TextInputType.number,
                         onChanged:(data){ setState(() {
                     door =data;
                     });
                                   
                                    
                                      
                     },
// obscureText:true,

                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.location_city),
                           hintText: "Door No.",
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
                    ))
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),





               area_field?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                        // keyboardType: TextInputType.number,
                         onChanged:(data){ setState(() {
                     adr1 =data;
                     });
                                   
                                    
                                      
                     },
// obscureText:true,

                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.add_location),
                           hintText: "Address line 1",
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
                    ))
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),



               area_field?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextField(
                        // keyboardType: TextInputType.number,
                         onChanged:(data){ setState(() {
                     adr2 =data;
                     });
                                   
                                    
                                      
                     },
// obscureText:true,r

                        decoration:  InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.add_location),
                           hintText: "Address line 2",
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
                    ))
                    
                    
                    :Padding(
                      padding: EdgeInsets.all(1),
                    ),









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




                          if(level==0){

                            if(mobile.length ==10){
setState(() {
                     btn='Check OTP';
                     loading=true;
                    });

                    checkno(context);

                            }
    else{

 showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please enter valid 10 digit number"),
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

    }


                          }


                         else if(level==1){

                            if(enter_otp==mobile_otp){
                            setState(() {pin_field=true;
                            level=2;
                                                btn='Check pincode';
                                                });

                            }

                    else{

showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Incorrect OTP"),
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


                    }
                    
                    
                     }

  else if(level==2){

if(pincode.length == 6){

checkpin(context);
setState(() {
 loading=true; 
});

}

   else{

showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Incorrect Pincode"),
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
                  }


  }

    else if(level==3){

if(area_changed){

if(name.length!=0){





if(pass.length>=8){






if(pass==con_pass){

setState(() {
  loading=true;
});

create_account(context);

}






else{
  showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Password not matching"),
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
}


}

else{
  showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Password required min. 8 character"),
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


}









}

else{


  showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please enter Name"),
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
 
}

}
else{

showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Please select Area"),
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
 

}


// print(mobile);
// print(pincode);
// print(areas[area_select]);
// print(name);
// print(pass);





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


                      ),
                    )),



                new Row(

                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   
                    new Text("Already a member?"),
                    new FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color.fromRGBO(244, 92, 31, 1),
                         
                        ),
                      ),
                    )
                  ],
                ),



new Padding(padding: EdgeInsets.only(bottom: 100),)


         
              ],
            ),
            ),
          ),
        ),
      
    );
  }
}
