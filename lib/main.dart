import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TDD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          key: Key('counter'),
          appBar: AppBar(
            title: Text('RXDART BLOC PATTERN')
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => counterBloc.increaseStream(),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () => counterBloc.decreaseStream(),
              ),
            ],
          ),
          body: Center(
            child: StreamBuilder<Object>(
              stream: counterBloc.pressedCount,
              builder: (context, snapshot) {
                print(snapshot.data);
                return Text(
                  '${snapshot.data}',
                  style: TextStyle(
                    fontSize: 22,
                  )
                );
              }
            )
          )
        )
    );
  }
}


