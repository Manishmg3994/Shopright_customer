
import 'package:flutter/material.dart';
import 'Cart.dart';
import 'productview.dart';
import 'search.dart';
import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:provider/provider.dart';
// import 'states.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProductListState();
  }
}

class ProductListState extends State<ProductList> {

  List catogory =["veg","grocery","fruits"];

var myname= "",pincode="",area="",mobile="",token="",myid="";
var no_data=false;
var loading=true;
var base_url = "";
List alldata = new List();

 List _fruits = ["Vegetable", "Grocery", "Fruits","Wishlist", "Discount Offer", "Cashback Offer"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;
Response response;








void productx(cat,endpoint) async {
  setState(() {
 loading=true;
 no_data= false;
});
  
  try {
   
   response = await Dio().post(base_url+"api/"+endpoint,data: {
      "customer_id": myid,
       "category":catogory[cat].toString(),
        "pincode":pincode,
        "area":area
    
    }
    ,options: Options(headers: {"Authorization": token})
    );
    print(response.data["result"]);
    
    if(response.data["status"])
    {
     
   alldata =  response.data["result"][0]["products"];
setState(() {
 loading=false;
});
     

   }

    else{
     
setState(() {
     loading=false; 
     no_data=true;
    });



    }
    
  } catch (e) {
    print(e);
  }
}

getSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
CounterModel model = ScopedModel.of(context);
//  print(model.myid);

 setState(() {
  myname =  prefs.getString("myname");
  myid =  prefs.getString("myid");
  pincode=prefs.getString("pincode");
  area=prefs.getString("area");
 
  token=prefs.getString("token");
 
 base_url = model.url; 



 });


if(model.productlist == 96){

productx( 1,"viewwishlist");


}

else if(model.productlist == 97){

  print("Discount Offer");

productx( 1,"discount_product");


}

else if(model.productlist == 98){
productx( 1,"cashback_product");


}

else{

productx(model.productlist,"pincodeproduct");

}

  }


  

  @override
  void initState() {
    getSharedPreferences();

    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);



CounterModel model = ScopedModel.of(context);




if(model.productlist == 96){

// productx( 1,"viewwishlist");

    _selectedFruit = _dropDownMenuItems[(_dropDownMenuItems.length  - 3)].value;



}

else if(model.productlist == 97){

      _selectedFruit = _dropDownMenuItems[(_dropDownMenuItems.length  - 2)].value;



}

else if(model.productlist == 98){
  

    _selectedFruit = _dropDownMenuItems[(_dropDownMenuItems.length - 1)].value;



}

else{
    _selectedFruit = _dropDownMenuItems[model.productlist].value;


}


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
      loading = true;
    });


if(selectedFruit == "Wishlist"){

productx( 1,"viewwishlist");


}

else if(selectedFruit == "Discount Offer"){

  print("Discount Offer");

productx( 1,"discount_product");


}

else if(selectedFruit ==  "Cashback Offer"){
productx( 1,"cashback_product");


}

else{

productx( _fruits.indexOf(selectedFruit),"pincodeproduct");

}

  }
  


var search = false;

  var ty =['fgvdxrvdx ddx xdgrxc dx','cgdvgdfb ','hjghfh uhnuuu ','jhgjjb jugnugjy ujutuj7t ','fghyybyg'];
  @override
  Widget build(BuildContext context) {
CounterModel model = ScopedModel.of(context);

       
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
                 
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SearchView()));

                // setState(() {
                //  search=true; 
                // });
              },
              ),

 new Padding(
                padding: EdgeInsets.only(top: 5.0,right: 5),
                child:

                ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return 
//  }),
                 new Stack(
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
                      
                       top: 6.0,
                      right: model.cart.length >= 10? 6.0:7.0,
                      child: new Text(model.cart.length.toString(),
                      
                      textAlign: TextAlign.center,
                      
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          
                        )
                      ),
                    ) ,
                  
                  ],
                );
              
              }),
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
 
 
 
 loading?Center(
   heightFactor:  MediaQuery.of(context).size.height/70,
  child:SpinKitThreeBounce(
  color: Colors.pink,
  size: 50.0,
  
)):


no_data?Center(
   heightFactor:  MediaQuery.of(context).size.height/30,

  child: new Text("No product Available..",style: new TextStyle(fontSize: 22),),
):

 
  new Expanded(
  
child:new GridView.builder(
        itemCount: alldata.length,
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



Image.network(alldata[index]["img_url"],
            // fit: BoxFit.fill,
         
           height: 100,
          ),

// ),
 




    Padding(padding: EdgeInsets.only(top: 15),),

         
   Padding(padding: EdgeInsets.only(top: 15,left: 10),
 child: Align(

  alignment: Alignment.centerLeft,

          child:new Text('₹ '+alldata[index]["price"].toString(),style: new TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),

   ),
  Padding(padding: EdgeInsets.only(top: 8,left: 10),
 child: Align(

  alignment: Alignment.center,

          child:new Text(alldata[index]["name"],style: new TextStyle( fontSize: 16,fontWeight: FontWeight.bold,color: Colors.brown),textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
    maxLines: 1,
          
          
          )),

   ),

  Padding(padding: EdgeInsets.only(top: 3,right: 10,bottom: 10),
 child: Align(

  alignment: Alignment.bottomRight,

          child:new Text(alldata[index]["unit"],style: new TextStyle(fontSize: 14),textAlign: TextAlign.left,)),

   ),




  ],
),
              
            ),
// new Text('hjgyugh',style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,  color: Colors.green),)

  ],
),
 
            onTap: () {
             print(alldata[index]["_id"]);
model.setProductid(alldata[index]["_id"]);

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