import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GroupView extends StatefulWidget{
  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
PanelController _pc = new PanelController();

 List _fruits = ['Active','InActive'];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);

    _selectedFruit = _dropDownMenuItems[1].value;

    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = new List();
    for (String fruit in fruits) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit,style: new TextStyle(fontSize: 18,color: Colors.brown),)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }
var open =false;
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
      backgroundColor: Colors.orange[300],
      title: Text("Group Products"),
      centerTitle: true,
     elevation: 0.0,
    ), 
    ),
    
    
    backgroundColor: Colors.grey[300],




    body: SlidingUpPanel(
minHeight:1,
maxHeight: MediaQuery.of(context).size.height-185,
color:Colors.orange[300],
// border: Border.all(color:Colors.black, width: 2),
      backdropColor: null,
borderRadius: BorderRadius.only(topRight: Radius.circular(100),),
controller: _pc,
// onPanelClosed:(){
// setState(() {
//  open = !open; 
// });

// },
      panel:SingleChildScrollView(

        child: Column(
        children: <Widget>[
Padding(padding: EdgeInsets.all(8),),
            new Text('Edit Delivery Info',style: new TextStyle(fontSize: 27),),
Padding(padding: EdgeInsets.all(8),),

new Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
children: <Widget>[


Text("Status",style: new TextStyle(fontSize: 18),),
new DropdownButton(
    
                value: _selectedFruit,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
                
              ),
 
],


),
       ],

        )
      ),




      body:
      new Column(

        children: <Widget>[
         

// 

new Container(


decoration: BoxDecoration(

// backgroundBlendMode:Colors.transparent,
  color:  Colors.orange[300],
  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))
),

  child: new Column(

children: <Widget>[
Padding(padding: EdgeInsets.all(5),),

new Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
new Row(
children: <Widget>[

  new Text("Status : ",style: new TextStyle(fontSize: 15),),
  new Text("Active",style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.red[800]),)
],
),

new Row(
children: <Widget>[

  new Text("Frequent : ",style: new TextStyle(fontSize: 15),),
  new Text("Weekly",style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.red[800]),)
],
),

new Row(
children: <Widget>[

  new Text("Day : ",style: new TextStyle(fontSize: 15),),
  new Text("Wednesday",style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.red[800]),)
],
),
],
),
Padding(padding: EdgeInsets.all(2)),

new Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[

new Row(
children: <Widget>[

  new Text("Time : ",style: new TextStyle(fontSize: 15),),
  new Text("02:18 PM",style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.red[800]),)
],
),
new Row(
  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[

  new Text("Contact : ",style: new TextStyle(fontSize: 15),),
  new Text("98785756757",style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.red[800]),)
],
),

],
),

Padding(padding: EdgeInsets.all(2),),



// Padding(padding: EdgeInsets.all(1),),
new Row(
  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[

  new Text("Address : ",style: new TextStyle(fontSize: 15),),


  new Text("Dineshkumar,17/170- B, Kandhasamypuram  ",overflow: TextOverflow.ellipsis,style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.red[800]),),
 



],
),
Padding(padding: EdgeInsets.all(2)),

new Row(
  mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[

  new Text("Pincode : ",style: new TextStyle(fontSize: 15),),
  new Text("636453 - Mecheri",style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.red[800]),),



],
),

// new Text("Contact : 98676545568"),
// Padding(padding: EdgeInsets.all(1)),

Align(alignment:Alignment.bottomRight,

child: Padding(padding: EdgeInsets.only(right :20),

child:ButtonTheme(
height: 30,
minWidth: 120,
buttonColor: Colors.blue,
  child:  RaisedButton(

   onPressed:() {

     setState(() {
      open = !open; 

      if(open){

_pc.open();

      }

      else{

        _pc.close();
      }
     });




   },
   
    // 
  child: Text('Edit',style: new TextStyle(color: Colors.white),),
),

)



),


)
],


  ),
),
  

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
child: Text(5.toString(),style: new TextStyle(fontSize: 15),),),

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
// new Text('hjgyugh',style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.red[800],  color: Colors.green),)
  // Padding(padding: EdgeInsets.all(5),)

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

// SizedBox(

//   height: 120,
// )   
        
        
        ],
      ),
      
      
    
    ),
  );
}
}