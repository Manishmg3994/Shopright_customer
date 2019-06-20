
import 'package:flutter/material.dart';
import 'Cart.dart';
import 'productview.dart';

import 'package:provider/provider.dart';
import 'states.dart';


class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProductListState();
  }
}

class ProductListState extends State<ProductList> {

 List _fruits = ["Vegetable", "Grocery", "Fruits","Wishlist", "Discount Offer", "Cashback Offer"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = new List();
    for (String fruit in fruits) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit,style: new TextStyle(fontSize: 20,),)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }


var search = false;

  var ty =['fgvdxrvdx ddx xdgrxc dx','cgdvgdfb ','hjghfh uhnuuu ','jhgjjb jugnugjy ujutuj7t ','fghyybyg'];
  @override
  Widget build(BuildContext context) {

       
        // final counter = Provider.of<States>(context);

    // _selectedFruit = _dropDownMenuItems[counter.getCountr()].value;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return new Scaffold(
backgroundColor: Colors.grey[200],



      appBar: new AppBar(
        
        
        title: search? new TextField(
          // controller: _filter,
          style: new TextStyle(color: Colors.white,fontSize: 18),
          decoration: new InputDecoration(
           
            hintText: 'Search...',
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white70),
             focusedBorder: UnderlineInputBorder( 
                    
                      borderSide: BorderSide(color: Colors.red[400]),   
                      ),    
          ),

          
        ):Text("Shopright"),
        

     



       actions: <Widget>[
         search? new IconButton(icon: new Icon(Icons.close),
              onPressed: (){

                setState(() {
                 search=false; 
                });
              },
              ):new IconButton(icon: new Icon(Icons.search),
              onPressed: (){

                setState(() {
                 search=true; 
                });
              },
              ),

 new Padding(
                padding: EdgeInsets.only(top: 5.0,right: 5),
                child: new Stack(
                  children: <Widget>[
                    new IconButton(icon: new Icon(Icons.shopping_cart),
                      onPressed: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                    ),
                  
          new Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: new Icon(Icons.brightness_1, size: 22.0, 
                        color: Colors.redAccent),
                    ) ,



                    new Positioned(
                      
                      top: 4.0,
                      right: 5.0,
                      child: new Text(74.toString(),
                      
                      textAlign: TextAlign.center,
                      
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          
                        )
                      ),
                    ) ,
                  
                  ],
                ),
              ),


        ],
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

 endDrawer: new Drawer(
   elevation: 50,
            child: new CartView(),
            // width: MediaQuery.of(context).size.width * 0.55,
          ),


body:



new Column(


children: <Widget>[
new Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,

children: <Widget>[

  new DropdownButton(
    
                value: _selectedFruit,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
                
              ),
 GestureDetector(


   child: new Row(children: <Widget>[


     Text("Sort by",style: new TextStyle(fontSize: 20),),
Padding(padding: EdgeInsets.only(left: 20),),
     Icon(Icons.sort)
   ],)
   
 )


],

),
  new Expanded(
  
child:new GridView.builder(
        itemCount: 5,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            
             childAspectRatio: MediaQuery.of(context).size.height/880,
              
              ),
        itemBuilder: (BuildContext context, int index) {
          return 
          
          new GestureDetector(

child:new Column(

  children: <Widget>[

   
  new Card(
             shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                
              ),
elevation: 5.0,
// semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
  margin:  EdgeInsets.all(12.0),



child: new Column(


  children: <Widget>[



    Padding ( padding: EdgeInsets.only(top: 25),),



// Hero(

//   tag: 'imgsr',



Image.asset('assets/sr_logo.png',
            fit: BoxFit.fill,
         
          //  height: 100,
          ),

// ),
 




    Padding(padding: EdgeInsets.only(top: 15),),

         
   Padding(padding: EdgeInsets.only(top: 15,left: 10),
 child: Align(

  alignment: Alignment.centerLeft,

          child:new Text('₹ 54.00',style: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),

   ),
  Padding(padding: EdgeInsets.only(top: 8,left: 10),
 child: Align(

  alignment: Alignment.center,

          child:new Text(ty[index],style: new TextStyle( fontSize: 16,fontWeight: FontWeight.bold,color: Colors.brown),textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
    maxLines: 1,
          
          
          )),

   ),

  Padding(padding: EdgeInsets.only(top: 3,right: 10,bottom: 10),
 child: Align(

  alignment: Alignment.bottomRight,

          child:new Text('500g',style: new TextStyle(fontSize: 14),textAlign: TextAlign.left,)),

   ),




  ],
),
              
            ),
// new Text('hjgyugh',style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,  color: Colors.green),)

  ],
),
 
            onTap: () {
             print(index);
            // Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductView()));
               
            },
          );



          
        }),)


  
],



)



    );
  }



}