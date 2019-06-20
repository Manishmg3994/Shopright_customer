import 'package:flutter/material.dart';

class States with ChangeNotifier {
  int _counter,dropdown;

  States(this._counter,this.dropdown);

  getStates() => _counter;

  getDropdown()=>dropdown;
  getCountr() => _counter;
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
}