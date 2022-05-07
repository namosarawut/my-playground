import 'package:flutter/material.dart';
import 'package:playground/state_management/BLoC/counter/counter_bloc.dart';
import 'package:playground/state_management/BLoC/counter/counter_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(title: 'BLoC',)
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final _bloc = CounterBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: StreamBuilder(
            stream: _bloc.counter,
            initialData:0 ,
            builder: (BuildContext context,AsyncSnapshot<int> snapshot){
              return Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 60.0),
              );
            },
          )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: ()=>_bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: ()=>_bloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),

        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }
}
