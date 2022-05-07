import 'package:flutter/material.dart';
import 'package:playground/state_management/provider101/slider_state.dart';
import 'package:provider/provider.dart';

class MyText extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<SliderState>(
        builder: (context, sliderState,_) {
          return Text("Value = ${sliderState.sliderValue.toStringAsFixed(2)}");
        }
        );
  }
}
