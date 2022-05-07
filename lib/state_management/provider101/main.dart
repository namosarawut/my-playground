import 'package:flutter/material.dart';
import 'package:playground/state_management/provider101/Mytext.dart';
import 'package:playground/state_management/provider101/slider.dart';
import 'package:playground/state_management/provider101/slider_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomePage());
  }
}

// mutipleProvider
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SliderState(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
        ),
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            MyText(),
            MySlider()
          ],
        )),
      ),
    );
  }
}

//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   double sliderValue = 0.5;
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SliderState(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Provider"),
//         ),
//         body: Container(
//             child: Column(
//               children: [
//                 SizedBox(height: 20,),
//                 MyText(),
//                 MySlider()
//               ],
//             )),
//       ),
//     );
//   }
//
//
// }
