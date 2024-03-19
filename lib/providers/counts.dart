import 'package:flutter/material.dart';

class Counts with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }


  bool _isWearing = false;

  bool get isWearing => _isWearing;

  void changeWearingStatus() {
    _isWearing = !_isWearing;
    notifyListeners();
  }
}