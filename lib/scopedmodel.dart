import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class CounterModel extends Model {
  int _counter = 54;

  

  int get counter => _counter;


  

  void increment() {
    // First, increment the counter
    _counter++;

    // Then notify all the listeners.
    notifyListeners();
  }



  String _url="http://ec2-13-233-141-122.ap-south-1.compute.amazonaws.com:9001/";

  String get url =>_url;



  int _productlist=1;

  int get productlist =>_productlist;

  void setProductlist(no){

_productlist = no;
    notifyListeners();

  }




  bool _searchbool=true;

  bool get searchbool =>_searchbool;

  void setSearchbool(no){

_searchbool = no;
    notifyListeners();

  }




  int _cart_qty=0;

  int get cart_qty =>_cart_qty;

  void SetCartQty(no){

_cart_qty = no;
    notifyListeners();

  }



  int _qty=0;

  int get qty =>_qty;

  void SetQty(no){

_qty = no;
    notifyListeners();

  }


  List _cart =new List();
  List get cart =>_cart;

  void SetCart(data){

 _cart=data;
    notifyListeners();

  }

  void RemoveCart(key){

    _cart.removeWhere((data) =>  
    data["product_id"] == key
    
    );
      notifyListeners();
  }





 List _search =new List();
  List get search =>_search;

  void SetSearch(data){

 _search=data;
    notifyListeners();

  }







 List _group =new List();
  List get group =>_group;

  void SetGroup(data){

 _group=data;
    notifyListeners();

  }





 List _groupProduct =new List();
  List get groupProduct =>_groupProduct;

  void SetGroupProduct(data){

 _groupProduct=data;
    notifyListeners();

  }


  void RemoveGroupProduct(key){

    _groupProduct.removeWhere((data) =>  
    data["product_id"] == key
    
    );
      notifyListeners();
  }




// replytile.removeWhere((item) => item.id == '001')




 String _productid="";

  String get productid =>_productid;

  void setProductid(idx){

_productid = idx;
    notifyListeners();

  }






 String _pincode="";

  String get pincode =>_pincode;

  void setPincode(idx){

_pincode = idx;
    notifyListeners();

  }


 String _token="";

  String get token =>_token;

  void setToken(idx){

_token = idx;
    notifyListeners();

  }

  
 String _area="";

  String get area =>_area;

  void setArea(idx){

_area = idx;
    notifyListeners();

  }




   String _myid ="";

  String get myid =>_myid;

  String setMyid(id){

_myid = id;
    notifyListeners();

  }





   String _groupid ="";

  String get groupid =>_groupid;

  String setGroupid(id){

_groupid = id;
    notifyListeners();

  }


  bool _islogin = false;

  bool get islogin => _islogin;

  void setLogin(io){


    _islogin = io;

    notifyListeners();
  }
}