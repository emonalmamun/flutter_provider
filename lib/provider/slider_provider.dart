import 'package:flutter/foundation.dart';
class SliderProvider with ChangeNotifier{
  double _number = 1.0;
  double get number => _number;

  void updateValue(double val){
    _number = val;
    notifyListeners();
  }
}