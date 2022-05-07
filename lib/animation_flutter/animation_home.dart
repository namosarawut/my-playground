import 'package:flutter/material.dart';
import 'package:playground/animation_flutter/animation_lavel_1.dart';

import 'animation_list.dart';

void main() {
  runApp(AnimationHome());
}

class AnimationHome extends StatefulWidget {
  const AnimationHome({Key? key}) : super(key: key);

  @override
  _AnimationHomeState createState() => _AnimationHomeState();
}

class _AnimationHomeState extends State<AnimationHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedListSample(),
    );
  }
}
