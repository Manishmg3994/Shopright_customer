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

  bool _islogin = false;

  bool get islogin => _islogin;

  void setLogin(io){


    _islogin = io;

    notifyListeners();
  }
}