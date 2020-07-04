import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int counter = 0;

  CounterBloc () {
    addValue.add(0);
  }

  final _counterStream = BehaviorSubject<int>();

  Observable<int> get pressedCount => _counterStream.stream;
  Sink <int> get addValue => _counterStream.sink;
  Sink <int> get decreaseValue => _counterStream.sink;


  void increaseStream () {
    counter += 1;
    addValue.add(counter);
  }

  void decreaseStream () {
    counter -= 1;
    decreaseValue.add(counter);
  }

  @override
  void dispose () {
    _counterStream.close();
  }

}








































//class CounterBloc {
//  int _counter;
//
//  CounterBloc() {
//    _counter = 1;
//    _actionController.stream.listen(_increaseStream);
//  }
//
//  final _counterStream = BehaviorSubject<int>();
//
//  Stream get pressedCount => _counterStream.stream;
//  Sink get _addValue => _counterStream.sink;
//
//  StreamController _actionController = StreamController();
//  StreamSink get incrementCounter => _actionController.sink;
//
//  void _increaseStream(data) {
//    _counter += 1;
//    _addValue.add(_counter);
//  }
//
//  void dispose() {
//    _counterStream.close();
//    _actionController.close();
//  }
//}

final counterBloc = CounterBloc();
