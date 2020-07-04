import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rx_dart_tdd/counter_bloc.dart';

import 'package:rx_dart_tdd/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    expect(find.byKey(Key('counter')), findsOneWidget);
  });

  test('Counter call', () async {
    CounterBloc counter = counterBloc;
    counter.increaseStream();
    counter.increaseStream();
    counter.increaseStream();
    counter.increaseStream();
    expectLater(counter.pressedCount, emits(4));
  });
  test('Counter decrease call', () async {
    CounterBloc counter = counterBloc;

    counter.decreaseStream();
    counter.decreaseStream();
    expect(counter.pressedCount, emits(2));
  });

}
