import 'package:flutter/material.dart';

class States with ChangeNotifier {
  int _counter =1;

  States(this._counter);

  getStates() => _counter;
  getCountr() => _counter;
  setStates(int counter) => _counter = counter;

  void stateSet(no) {
    _counter=no;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}