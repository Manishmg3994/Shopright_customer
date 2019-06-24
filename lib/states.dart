import 'package:flutter/material.dart';

class States with ChangeNotifier {
  int _counter,dropdown,cart;

  States(this._counter,this.dropdown,this.cart);

  getStates() => _counter;

  getDropdown()=>dropdown;
  getCountr() => _counter;


getCart()=>cart;
setCart(int _cart)=> cart=_cart;

  setStates(int counter) => _counter = counter;
  setDropdown(int drop) => dropdown = drop;

  void stateSet(no) {
    _counter=no;
    notifyListeners();
  }

  void dropdownSet(no) {
    dropdown=no;
    notifyListeners();
  }

  void setCartState(no) {
    cart=no;
    notifyListeners();
  }
}