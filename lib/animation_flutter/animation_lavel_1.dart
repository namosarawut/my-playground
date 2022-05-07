import 'package:flutter/material.dart';






class AnimationLavel1 extends StatefulWidget {
  const AnimationLavel1({Key? key}) : super(key: key);

  @override
  State<AnimationLavel1> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AnimationLavel1> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 200.0 : 100.0,
            height: selected ? 100.0 : 200.0,
            color: selected ? Colors.red : Colors.blue,
            alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(size: 75),
          ),
        ),
      ),
    );
  }
}

