import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'productview.dart';
import 'productlist.dart';

import 'package:provider/provider.dart';
import 'states.dart';
final List<String> imgList = [
  'http://www.lingandsons.com/readBlob.do?id=5431',
  'https://5210.psu.edu/wp-content/uploads/2018/05/food-fruits-veggies-shopping.jpg',
  'https://foodrevolution.org/wp-content/uploads/2017/12/blog-featured-eat_the_rainbow_oranges-20171207.png',
  // 'https://images.jdmagicbox.com/comp/vijayawada/h6/0866px866.x866.170113004303.u4h6/catalogue/v-mart-siddhartha-nagar-vijayawada-grocery-stores-c7v48.jpg',
  'https://breastcancer-news.com/wp-content/uploads/2018/07/shutterstock_793959790_zpsny04h5b8-1024x480.jpg'
  
   ];

class MainScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    
        final counter = Provider.of<States>(context);
    return new MaterialApp(
    debugShowCheckedModeBanner: false,

    
      home: new Scaffold(
       
        body:
        
        new ListView(


          children: <Widget>[

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
onTap: (){print('sdxsfdx');},
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
onTap: (){print('sdxsfdx');},
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


          ],
        )
        
        
      
      ),
    );
  }
}




















