import 'package:flutter/material.dart';
import 'package:playground/state_management/providerExample/model/notimodel.dart';

import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotiModel>(
      builder: (context, notiModel, child) => Scaffold(
        appBar: AppBar(
          title: Text("Second"),
        ),
        body: Column(
          children: [
            Text(notiModel.text1),
            Text(notiModel.text2),
            ElevatedButton(onPressed: () {
              notiModel.text2 = "Change by Button";
            }, child: Text("Chage value"))
          ],
        ),
      ),
    );
  }
}



