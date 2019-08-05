import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';

class Testing extends StatefulWidget {
  

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {


  @override
  Widget build(BuildContext context) {
   
 

    return Scaffold(
         appBar: new AppBar(
        
       title: Text("erderf"),



      
     
      ),

  body: 
  


   ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext cont, int ind) {
              return AnimatedCard(
    direction: AnimatedCardDirection.left, //Initial animation direction 
    initDelay: Duration(milliseconds: 1), //Delay to initial animation
    duration: Duration(seconds: 3), //Initial animation duration
    // onRemove: () => lista.removeAt(index), //Implement this action to active dismiss

    child: Text("data"),
);

            })
  
  );
  }
}
