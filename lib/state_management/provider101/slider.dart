import 'package:flutter/material.dart';
import 'package:playground/state_management/provider101/slider_state.dart';
import 'package:provider/provider.dart';


class MySlider extends StatelessWidget {

  Widget build(BuildContext context) {
    final sliderState = Provider.of<SliderState>(context);
    return Slider(
        min: 0,
        max: 1,
        value: sliderState.sliderValue,
        onChanged: (double value) {
          sliderState.sliderValue = value;
        });
  }

}
