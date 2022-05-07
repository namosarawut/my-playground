
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'first.dart';
import 'model/appmodel.dart';
import 'model/notimodel.dart';

import 'package:flutter/material.dart';

void main() => runApp(MainProvider());



class MainProvider extends StatelessWidget {
  const MainProvider({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppModel>(create:(_) => AppModel()),
        ChangeNotifierProvider<NotiModel>(create: (_) => NotiModel())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FirstPage()
      ),
    );
  }
}

