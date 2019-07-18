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


  int _cart_qty=0;

  int get cart_qty =>_cart_qty;

  void SetCartQty(no){

_cart_qty = no;
    notifyListeners();

  }




  List _cart =new List();
  List get cart =>_cart;

  void SetCart(data){

 _cart.add(data);
    notifyListeners();

  }


  void RemoveCart(key){

    _cart[0].removeWhere((data) =>  
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


   String _myid ="";

  String get myid =>_myid;

  String setMyid(id){

_myid = id;
    notifyListeners();

  }






  bool _islogin = false;

  bool get islogin => _islogin;

  void setLogin(io){


    _islogin = io;

    notifyListeners();
  }
}