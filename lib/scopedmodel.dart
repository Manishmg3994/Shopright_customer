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






  int _productlist=1;

  int get productlist =>_productlist;

  void setProductlist(no){

_productlist = no;
    notifyListeners();

  }

  bool _islogin = false;

  bool get islogin => _islogin;

  void setLogin(io){


    _islogin = io;

    notifyListeners();
  }
}