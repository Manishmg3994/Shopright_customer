import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GroupView extends StatelessWidget{

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Group Products"),
    ),
    backgroundColor: Colors.grey[300],
    body: SlidingUpPanel(
minHeight:60,
maxHeight:450,
color:Colors.yellow[200],
border: Border.all(color:Colors.green, width: 2),
      backdropColor: null,
borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight: Radius.circular(70)),


      panel:Column(
        children: <Widget>[

            new Text('data')


        ],
      ),




      body:
      new Column(

        children: <Widget>[
 new Expanded(
  child:new ListView.builder(
        itemCount: 6,
       
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
child: Image.asset('assets/sr_logo.png',
            fit: BoxFit.fill,
         
          //  height: 100,
          //  width: 100,
          ),
 ),

  //imgeo



  Expanded(
          flex: 4, // 
child: new Column(
    
children: <Widget>[


Align(

  alignment: Alignment.center,

  child: new Text('Apple ', overflow: TextOverflow.ellipsis,style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
    maxLines: 2,),
),





Padding(padding: EdgeInsets.only(top:18,right: 10),

child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[


    Text('₹ 54.00'),

    Text('500g')
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


//   Column(

//     children: <Widget>[
// Padding(


//   padding: EdgeInsets.only(bottom: 5),

//   child: RaisedButton(

//         onPressed: null,


//         child: Text('button'),
//       ),
// )

      
//     ],
//   ),


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

    


        child: Text('+',textAlign: TextAlign.center,style: new TextStyle(fontSize: 25,color: Colors.white),),
      ),
),


Padding(padding: EdgeInsets.only(left: 15,right: 15),
child: Text(5.toString(),style: new TextStyle(fontSize: 20),),),

     SizedBox(
  width: 50, // specific value
  child: RaisedButton(
color: Colors.red,
    

        child: Text('-',textAlign: TextAlign.center,style: new TextStyle(fontSize: 35,color: Colors.white),),
      ),
),




    ],
  ),




RaisedButton(onPressed: null,

child:Text("Remove"))

  ],
),

 
],







),





















              
            ),
// new Text('hjgyugh',style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,  color: Colors.green),)
  Padding(padding: EdgeInsets.all(5),)

  ],
);
 
            // onTap: () {
            //  print(index);
            // // Navigator.of(context).pop();
            //     // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new WebViewContainer(list[index].link,list[index].name)));
               
            // },
          // );



          
        }),

// new Padding(padding: EdgeInsets.all(20),)

 ),

SizedBox(

  height: 120,
)   
        
        
        ],
      ),
      
      
    
    ),
  );
}

}