import 'package:flutter/material.dart';

class AppbarBehind extends StatefulWidget {
  const AppbarBehind({Key? key}) : super(key: key);

  @override
  _AppbarBehindState createState() => _AppbarBehindState();
}

class _AppbarBehindState extends State<AppbarBehind> {
  // Create a variable
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          print('At the bottom');
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        backgroundColor: Colors.black12,
        title: Text("TiTle"),
      ),
      body: ListView(
        controller: _controller,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
          ElevatedButton(onPressed: () {}, child: Text("Button")),
        ],
      ),
    );
  }
}
