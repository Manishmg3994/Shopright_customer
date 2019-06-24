import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'search.dart';
// import 'package:provider/provider.dart';
// import 'states.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scopedmodel.dart';
import 'grouphome.dart';
import 'groupview.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
   print(prefs.getBool("islogin"));
if(prefs.getBool("islogin")==null){
// model.setLogin(false);
setState(() {
 status=false; 
});
}

else{
// model.setLogin(prefs.getBool("islogin"));

print('hjcfjr');
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
















class HomePage extends StatelessWidget {




_saveValues(io) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("islogin",io);
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
                      child: new TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Enter your Email',
                            labelText: 'Email',
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
                      child: new TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.vpn_key),
                            hintText: 'Enter your Password',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      ),
                    )),
                new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: new FlatButton(
                      onPressed: () => null,
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


                              _saveValues(true);
                      // model.setLogin(true);

                Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => new AppHome()));

                        },
                        child: new Text(
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


















class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}


class _MyAppState extends State<Register> {
  @override

  var show=false;
var form=false;
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





Padding(padding: EdgeInsets.only(top:50),),
 new Image.asset("assets/sr_logo.png",height: 100,width: 100,),

  new Padding(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 5),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: new TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.phone),
                           
                            labelText: 'Mobile No.',
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
                      ),
                    )),



            show?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.message),
                           
                            labelText: 'OTP',
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
               




            form?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.person),
                           
                            labelText: 'Name',
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
               

               
            form?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.mail),
                           
                            labelText: 'Mail',
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
               

    
            form?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.vpn_key),
                           
                            labelText: 'Password',
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
               

    
            form?    new Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    child: new Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: new TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            prefixIcon: const Icon(Icons.vpn_key),
                           
                            labelText: 'Confirm Password',
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
                      width: double.infinity,
                      child: new RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color.fromRGBO(244, 92, 31, 1),
                        onPressed: () {




                          if(show==false){

setState(() {
                     show=true;
                     btn='Check OTP';
                    });

                          }


                         else{




                    setState(() {form=true;
                     btn='Register';
                    });


                          }

                         
                    print(show);
                        },
                        child: 
                        // CircularProgressIndicator(backgroundColor: Colors.grey,)
                        
                        
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
