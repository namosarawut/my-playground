
import 'package:flutter/material.dart';

class SliderState with ChangeNotifier {
  double _sliderValue = 0.5;

  double get sliderValue => _sliderValue;

  set sliderValue(double newvalue) {
    _sliderValue = newvalue;
    notifyListeners();
  }
}