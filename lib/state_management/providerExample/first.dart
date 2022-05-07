import 'package:flutter/material.dart';
import 'package:playground/state_management/providerExample/second.dart';
import 'package:provider/provider.dart';

import 'model/appmodel.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstPage"),
      ),
      body: Consumer<AppModel>(builder: (context, appModel, child) {
        return Column(
          children: [
            Text(appModel.text1),
            Text(appModel.text2),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    appModel.text1 = 'Change in Button';
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text("Chage"))
          ],
        );
      }),
    );
  }
}
