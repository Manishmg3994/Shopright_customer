import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'productlist.dart';
import 'productview.dart';
import 'Cart.dart';
import 'myorders.dart';
import 'package:provider/provider.dart';
import 'states.dart';
class AppHome extends StatefulWidget {

  @override
  _AppHomeState createState() => new _AppHomeState();
}

class _AppHomeState extends State<AppHome> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  void initState() {
    super.initState();
   
  }




 @override
  void dispose() {
    // Dispose of the Tab Controller
   
    super.dispose();
  }

  

  @override











var search = false;

List<Widget> _widgetOptions = <Widget>[
   new MainScreen(),new ProductList(),new ProductView(),new MyOrders()
];



  Widget build(BuildContext context){

        final counter = Provider.of<States>(context);

    return new Scaffold(

 key: _scaffoldKey,

 
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
        
//         GestureDetector(
// child:     Container(
//           width: 100,
//           height: 45,
// decoration: BoxDecoration(

//   // color: Colors.red,
//   border: Border.all(width: 0.5,color: Colors.grey),
  
// ),
//           child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[

//               Text("My Location",style: new TextStyle(fontSize: 10),),

//               Text("636451",style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
//               Text("mecheri",style: new TextStyle(fontSize: 10),),
//             ],
//           )
//         ),

// onTap: ()=>print('cdfg'),

//         ),
        
        
     



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

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
             

 accountName: Text('Dinesh Kumar',style: new TextStyle(fontSize: 25),),
                    accountEmail: Text('developine.com@gmail.com'),
                   
                    decoration: BoxDecoration( image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new ExactAssetImage('assets/menu_back.jpg'),
                )),




            
            ),










            new ListTile(
              leading: Icon(Icons.home,color:Colors.orange[800]),
              title: new Text("Home",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();
               counter.stateSet(0);


                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),


            new ListTile(
              leading: Icon(Icons.shopping_cart,color:Colors.green),
              title: new Text("My Cart",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();

                        _scaffoldKey.currentState.openEndDrawer();

                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),
            


            new ListTile(
              leading: Icon(Icons.shopping_basket,color:Colors.yellow[800]),
              title: new Text("My Orders",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                Navigator.of(context).pop();
              //  counter.stateSet(3);
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));
              }
            ),

            


            new ListTile(
              leading: Icon(Icons.favorite,color: Colors.pink,),
              title: new Text("Wishlist",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                //Navigator.of(context).pop();
                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),

new ListTile(
              leading: Icon(Icons.assignment,color: Colors.deepPurple,),
              title: new Text("Group Order",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                //Navigator.of(context).pop();
                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),


new ListTile(
              leading: Icon(Icons.attach_money,color:Colors.deepPurple),
              title: new Text("My Wallet",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                //Navigator.of(context).pop();
                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),

new ListTile(
              leading: Icon(Icons.language,color:Colors.blue),
              title: new Text("Language",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                //Navigator.of(context).pop();
                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),
new ListTile(
              leading: Icon(Icons.arrow_back,color: Colors.red,),
              title: new Text("Logout",style: new TextStyle(fontSize: 17,color: Colors.brown),),
             onTap: () {
                //Navigator.of(context).pop();
                // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("First Page")));
              }
            ),

new Padding(padding: EdgeInsets.only(bottom: 20),)








          ],

        
        ),
      ),




       
        body: _widgetOptions[counter.getCountr()]


    );
  }
}
