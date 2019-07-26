import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'states.dart';
import 'package:dio/dio.dart';


import 'scopedmodel.dart';
import 'package:scoped_model/scoped_model.dart';
class Testing extends StatefulWidget {
  

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
void Search(context,key) async {
 Response response;

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

// model.SetSearch(response.data["result"][0]["products"]);

print(response.data);
    
  } catch (e) {
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
   
 

    return Scaffold(
         appBar: new AppBar(
        
        backgroundColor: Colors.white,
        title:
         new TextField(
          // controller: _filter,
          onChanged: (zzz){

print(zzz);

Search(context, zzz);

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
child:

ListView.builder(
        itemCount:5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("fytf",style: new TextStyle(fontSize: 15),),
leading:  Text(""),
            // trailing: Text("Veg"),
            onTap: (){
              

              print("object");
            },
          );
        },
      )



    // ],
  )
    );
  }
}
