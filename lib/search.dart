

// import 'package:flutter/material.dart';
// import 'package:material_search/material_search.dart';
// import 'productlist.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:dio/dio.dart';

// import 'scopedmodel.dart';
// import 'package:scoped_model/scoped_model.dart';
// // import './components.dart';

// class SearchView {


// // void Search(context,key) async {
// //  Response response;

// //    var dio = Dio();
// //   try {
   
// //     // print("response.data");
// //     CounterModel model = ScopedModel.of(context);
// //     // print(model.token);
// //     // print(model.pincode);
// //     // print(model.area);
 
 
// //      response = await dio.post(model.url+"api/search",
     
// //      data: {
// //        "key":key,
// //         "pincode":model.pincode,
// //         "area":model.area
    
// //     }
// //     ,options: Options(headers: {"Authorization": model.token})
// //     );

// // model.SetSearch(response.data["result"][0]["products"]);
    
// //   } catch (e) {
// //     print(e);
// //   }
// // }




//   _buildMaterialSearchPage(BuildContext context) {
//     return new MaterialPageRoute<String>(
//       settings: new RouteSettings(
//         name: 'material_search',
//         isInitialRoute: false,
//       ),
//       builder: (BuildContext context) {
//         return new Material(
//           child:
//  ScopedModelDescendant<CounterModel>(
//               builder: (context, child, model) {
//                 return      
          
//            new MaterialSearch<String>(
        
//             placeholder: 'Search for products',
//             results: model.search.map(( v) => new MaterialSearchResult<String>(
//               // icon: Icons.person,
//               value: v["id"],
//               text: v["name"],
//             )).toList(),

        

//             filter: (dynamic value, String criteria) {

       

           


             
//               print(criteria);
              
//     // Search(context,criteria);

//                return 
               
//                value.toLowerCase().trim()
//                 .contains(new RegExp(r'' + criteria.toLowerCase().trim() + ''));
//             },
            
//             onSelect: (dynamic value) {
             
//               print("value");
//               print(value);
//                Navigator.of(context).pop(value);
               
//                },
               
//             onSubmit: (String value) => Navigator.of(context).pop(value),
//           );


//               })
//         );
//       }
//     );
//   }

//   showMaterialSearch(BuildContext context) {
   
//     Navigator.of(context)
//       .push(_buildMaterialSearchPage(context))
//       .then((dynamic value) {
//         // print(value);
//         if (value != null) {
//           // dialog(context, "search select");

//                   //  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductList()));

//         }
//       });
//   }
// }




import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'states.dart';
import 'package:dio/dio.dart';


import 'scopedmodel.dart';
import 'productview.dart';
import 'package:scoped_model/scoped_model.dart';
class SearchView extends StatefulWidget {
  

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  Response response;
List find = [];
void Search(context,key) async {
 
   var dio = Dio();
  try {
   
    // print("response.data");
    CounterModel model = ScopedModel.of(context);
    // print(model.token);
    // print(model.pincode);
    // print(model.area);
 
 
     response = await dio.post(model.url+"api/search",
     
     data: {
       "key":key,
        "pincode":model.pincode,
        "area":model.area
    
    }
    ,options: Options(headers: {"Authorization": model.token})
    );

model.SetSearch(response.data["result"][0]["products"]);

setState(() {
 find = response.data["result"][0]["products"];
});

print(find);
    
  } catch (e) {
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
   
//  print(find.length.toString());
    CounterModel model = ScopedModel.of(context);

    return Scaffold(
         appBar: new AppBar(
        iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        backgroundColor: Colors.white,
        title:
         new TextField(
          // controller: _filter,
          onChanged: (zzz){
            if(zzz.length>0){


Search(context, zzz);
              
            }

            else{

              setState(() {
 find = [];
});
            }



          },
          style: new TextStyle(color: Colors.black87,fontSize: 18),
          decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: 'Search the products.....',
            fillColor: Colors.black,
            hintStyle: TextStyle(color: Colors.grey[500]),
          ),

          
        )

       

        
        
     



      
     
      ),

  body:  Center(
    // children: <Widget>[
child:find.length!=0?

ListView.builder(
        itemCount:find.length,
        // response.data["result"][0]["products"].length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(find[index]["name"],style: new TextStyle(fontSize: 15),),
leading:  Text(""),
            // trailing: Text("Veg"),
            onTap: (){
              
model.setProductid(find[index]["id"]);
Navigator.of(context).pop();
     Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ProductView()));
      
            },
          );
        },
      ):Text("")



    // ],
  ),


  


  
    );

    
  }
}
