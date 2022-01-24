import 'dart:async';

import 'dart:developer';

enum CounterAction { Increment, Decrement, Reset }

class ViewBloc {
  final _stateStreamController = StreamController<bool>();
  StreamSink<bool> get viewtSink => _stateStreamController.sink;
  Stream<bool> get viewStream => _stateStreamController.stream;

  final _timeStreamController = StreamController<String>();
  StreamSink<String> get timetSink => _timeStreamController.sink;
  Stream<String> get timeStream => _timeStreamController.stream;

  final _timepickerStreamController = StreamController<bool>();
  StreamSink<bool> get timepickertSink => _timepickerStreamController.sink;
  Stream<bool> get timepickerStream => _timepickerStreamController.stream;
}
