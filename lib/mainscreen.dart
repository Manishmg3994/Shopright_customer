import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'productview.dart';
import 'productlist.dart';
import 'myorders.dart';
import 'package:quiver/async.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'package:provider/provider.dart';
import 'states.dart';
final List<String> imgList = [
  'http://www.lingandsons.com/readBlob.do?id=5431',
  'https://5210.psu.edu/wp-content/uploads/2018/05/food-fruits-veggies-shopping.jpg',
  'https://foodrevolution.org/wp-content/uploads/2017/12/blog-featured-eat_the_rainbow_oranges-20171207.png',
  // 'https://images.jdmagicbox.com/comp/vijayawada/h6/0866px866.x866.170113004303.u4h6/catalogue/v-mart-siddhartha-nagar-vijayawada-grocery-stores-c7v48.jpg',
  'https://breastcancer-news.com/wp-content/uploads/2018/07/shutterstock_793959790_zpsny04h5b8-1024x480.jpg'
  
   ];
var moviesTitles = ['Inception', 'Heat', 'Spider Man'];



int _start = 10;
int _current = 10;
var difference;
class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
// class MainScreen extends StatelessWidget {
  @override
 
  void initState() {

     final birthday = DateTime(2019, 06, 20);
 final date2 = DateTime.now();
  difference = birthday.difference(date2).inMinutes;



    CountdownTimer countDownTimer = new CountdownTimer(
    new Duration(seconds: 120),
    new Duration(seconds: 1),
  );

  var sub = countDownTimer.listen(null);
  sub.onData((duration) {
    setState(() { _current = 120 - duration.elapsed.inSeconds; });
  });

  sub.onDone(() {
    print("Done");
    sub.cancel();
  });
    super.initState();
  }

  
@override






  Widget build(BuildContext context) {

    
        final counter = Provider.of<States>(context);
    return new MaterialApp(
    debugShowCheckedModeBanner: false,

    
      home: new Scaffold(
       
        body:
        
        new ListView(


          children: <Widget>[


            new Row(
mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

new Row(children: <Widget>[
 Icon(Icons.place,size: 20,
 color: Colors.orange[600],),
Padding(padding: EdgeInsets.all(1),),
            Text('636452',style: new TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),)
         
            ,Text(' - First Zone ', overflow: TextOverflow.ellipsis,
    maxLines: 1,style: new TextStyle(color: Colors.brown),),


],),



Padding(padding: EdgeInsets.only(right: 20)),

    ButtonTheme(
           
  minWidth: 40.0,
  height: 30.0,
  buttonColor: Colors.pinkAccent,
          child:
          
       FlatButton(


         onPressed: (){print('Change Location');},

         child: Text('Change Location',style: new TextStyle(color:Colors.blue),),
       ),

          ),
              ],
            ),






   




// Padding(padding: EdgeInsets.only(left:10,right: 10),child:  GradientCard(
            
//     gradient: Gradients.coldLinear,
//     shadowColor: Gradients.tameer.colors.last.withOpacity(0.25),
//     elevation: 8,
//     child: new Column(


//       children: <Widget>[


// Padding(padding: EdgeInsets.all(5),

// child:         Text('My Location',style: new TextStyle(fontSize: 18),),


// ),
// // Padding(padding: EdgeInsets.all(15),),

//         new Row(
// mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[

//             Icon(Icons.place,size: 30,),
// // Padding(padding: EdgeInsets.all(2),),
//             Text('636452',style: new TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)
         
//             ,Text(' - First Zone', overflow: TextOverflow.ellipsis,
//     maxLines: 1,),
         
         
//           ],
//         ),
// // Padding(padding: EdgeInsets.all(2),),
// //          new Row(
// // mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[

// //             Text('Zone : '),
// //             Text('First Zone,Second Zone'),
// //           ],
// //         ),

// // Padding(padding: EdgeInsets.all(2),),

// Padding(padding: EdgeInsets.only(right: 10),
//        child: Align(

//           alignment: Alignment.centerRight,

//          child: ButtonTheme(
           
//   minWidth: 50.0,
//   height: 30.0,
//   buttonColor: Colors.pinkAccent,
//           child:RaisedButton(

            
// onPressed: (){


// },
// child: Text('change location'),

//           )

//           )
//         )

// )
//       ],
//     )
// ),),
          
Padding(padding: EdgeInsets.all(5),),

              CarouselSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      
      enlargeCenterPage: true,
      items: imgList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    ),


Padding(padding: EdgeInsets.only(top:15,left: 10,right: 10,bottom: 3),
 child: new Divider(color: Colors.black,),
),

Align(

 alignment: Alignment.center,

  child:new Text("Shop by Catogry",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Color(0xff0a0047),),)
),

Padding(padding: EdgeInsets.only(bottom: 15),),
new Row(

mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: <Widget>[


GestureDetector(
               
                onTap: (){ Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
 },
  child:  Card(
color: Color(0xfff7fcf9),
  elevation: 10,
child: new Padding(
padding: EdgeInsets.all(15),
child: new Column(
children: <Widget>[
Image.asset(
        'assets/vegetables.png',
        height: 60.0,
        width: 60.0,
        alignment: Alignment.center,
      ),
   Padding(
padding: EdgeInsets.only(top:15),
        child: new Text('Vegetable',style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xff012811)),),
      )
],)),), 
),



GestureDetector(
                onTap: (){ Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
 },
  child:  Card(
color: Color(0xfff7fcf9),
  elevation: 10,
child: new Padding(
padding: EdgeInsets.all(15),
child: new Column(
children: <Widget>[
Image.asset(
        'assets/fruits.png',
        height: 60.0,
        width: 60.0,
        alignment: Alignment.center,
      ),
   Padding(
padding: EdgeInsets.only(top:15),
        child: new Text('Fruits',style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xff012811)),),
      )
],)),), 
),



GestureDetector(
                onTap: (){ 
                  
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
 },
  child:  Card(

    
color: Color(0xfff7fcf9),

  elevation: 10,
child: new Padding(
padding: EdgeInsets.all(15),
child: new Column(
children: <Widget>[
Image.asset(
        'assets/grocery.png',
        height: 60.0,
        width: 60.0,
        alignment: Alignment.center,
      ),

      Padding(
padding: EdgeInsets.only(top:15),
        child: new Text('Grocery',style: new TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:  Color(0xff012811),),),
      )

],)),), 
),


],


),



  
Padding(padding: EdgeInsets.only(top:15,left: 10,right: 10,bottom: 3),
 child: new Divider(color: Colors.black,),
),



Align(

 alignment: Alignment.center,

  child:new Text("Discount Offer",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Color(0xff0a0047),),)
),

Padding(padding: EdgeInsets.only(bottom: 15),),

Container(
  // height: 359,
  child: CarouselSlider(
    height: 300,
  
      viewportFraction: 0.65,
      aspectRatio: 2.0,
      // autoPlay: true,
      
      enlargeCenterPage: true,
      
      items: imgList.map(
        (url) {
          return 
              
new GestureDetector(

  child:
                new Card(
             
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                
              ),
             color: Color(0xffedf3ff),
            child: Container(
            width: 200,

            decoration: BoxDecoration(



            ),
child:Column(
              children: <Widget>[


// Padding(padding: EdgeInsets.only(left:50,right: 50),),



                Row(

mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
new Container(
  margin: const EdgeInsets.all(15.0),
  padding: const EdgeInsets.all(3.0),
  decoration: new BoxDecoration(
    color: Colors.lightGreen[100],
    border: new Border.all(color: Colors.pink,),
    borderRadius:new BorderRadius.all(Radius.circular(20.0)) ,
  ),
  child: new Text(" 21% off " ,style: new TextStyle(),),
),


Padding(padding: EdgeInsets.only(right:10),

child:

new Text('$_current',style: new TextStyle(),)
 ),


                    
                  ],
                ),

                

Image.asset('assets/sr_logo.png',
            fit: BoxFit.fill,
         
          
          ),

Padding(padding: EdgeInsets.all(5),),

    new Text("Banana",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.brown),),
         
Padding(padding: EdgeInsets.all(5),),

Row(



mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: <Widget>[




    new Text("₹ 38.00",style: new TextStyle(fontSize: 18,),),
    new Text("2 kg",style: new TextStyle(fontSize: 18,color: Colors.grey),),



  ],
),


              
              ],

),
            ),
            ),


            onTap: (){


              print(url);
            },
          );
        },
      ).toList(),
    ),
),
 
Padding(padding: EdgeInsets.all(5),),
 Padding(
padding: EdgeInsets.only(right:10),
child:Align(


  alignment: Alignment.center,

  child: 
 new RaisedButton(color: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),), padding: EdgeInsets.all(15),
                      onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
                     
                      },
                      child: new Text("     View More     ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
                  ),
), 


 ),
  






Padding(padding: EdgeInsets.only(top:10,left: 10,right: 10,bottom: 3),
 child: new Divider(color: Colors.black,),
),

Align(

 alignment: Alignment.center,

  child:new Text("Cashback Offer",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color:Color(0xff0a0047),),)
),

Padding(padding: EdgeInsets.only(bottom: 15),),

Container(
  // height: 359,
  child: CarouselSlider(
    height: 300,
  
      viewportFraction: 0.65,
      aspectRatio: 2.0,
      // autoPlay: true,
      
      enlargeCenterPage: true,
      
      items: imgList.map(
        (url) {
          return 
              
new GestureDetector(

  child:
                new Card(
             
       shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0),
                
              ),
             color: Color(0xffffedf6),
            child: Container(
            width: 200,

            decoration: BoxDecoration(



            ),
child:Column(
              children: <Widget>[


// Padding(padding: EdgeInsets.only(left:50,right: 50),),



                Row(

mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
new Container(
  margin: const EdgeInsets.all(15.0),
  padding: const EdgeInsets.all(3.0),
  decoration: new BoxDecoration(
    color: Colors.lightGreen[100],
    border: new Border.all(color: Colors.pink,),
    borderRadius:new BorderRadius.all(Radius.circular(20.0)) ,
  ),
  child: new Text(" 50% cashback " ,style: new TextStyle(),),
),


Padding(padding: EdgeInsets.only(right:10),

child:

new Text(difference.toString(),style: new TextStyle(),)
 ),


                    
                  ],
                ),

                

Image.asset('assets/sr_logo.png',
            fit: BoxFit.fill,
         
          
          ),

Padding(padding: EdgeInsets.all(5),),

    new Text("Tomato",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.brown),),
         
Padding(padding: EdgeInsets.all(5),),

Row(



mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: <Widget>[




    new Text("₹ 20.00",style: new TextStyle(fontSize: 18,),),
    new Text("1 kg",style: new TextStyle(fontSize: 18,color: Colors.grey),),



  ],
),


              
              ],

),
            ),
            ),


            onTap: (){


              print(url);
            },
          );
        },
      ).toList(),
    ),
),

Padding(padding: EdgeInsets.all(5),),
 Padding(
padding: EdgeInsets.only(right:10),
child:Align(


  alignment: Alignment.center,

  child: 
 new RaisedButton(color: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),), padding: EdgeInsets.all(15),
                      onPressed: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
                     
                      },
                      child: new Text("     View More     ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
                  ),
), 


 ),

 Padding(padding: EdgeInsets.only(top:10,left: 10,right: 10,bottom: 30),
 child: new Divider(color: Colors.black,),
),

          ],
        )
        
        
      
      ),
    );
  }
}




















