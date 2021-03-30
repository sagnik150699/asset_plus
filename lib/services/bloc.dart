import 'package:flutter/material.dart';

class PageCounterBloc extends ChangeNotifier{
  int _counter=0;
  int get counter => _counter;

  set counter(int val){
    notifyListeners();
  }
  valuesCounter(int page){
    _counter=page;
    notifyListeners();
  }
}