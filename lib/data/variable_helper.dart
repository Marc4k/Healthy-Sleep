import 'package:shared_preferences/shared_preferences.dart';

class Variable_helper {
  static final Variable_helper _instance = Variable_helper._internal();

  // passes the instantiation to the _instance object
  factory Variable_helper() => _instance;

  bool _format_24h;
  int _fall_asleep;
  int _language;
  bool _sleepnow_bool;
  Variable_helper._internal() {
    _format_24h = true;
    _fall_asleep = 1;
    _language = 1;
  }

  //getter
  bool get format_24h => _format_24h;

  //setter
  set format_24h(bool value) => _format_24h = value;

  //getter
  int get fall_asleep => _fall_asleep;

  //setter
  set fall_asleep(int value) => _fall_asleep = value;

  //getter
  int get language => _language;

  //setter
  set language(int value) => _language = value;

  bool get sleepnow_bool => _sleepnow_bool;

  //setter
  set sleepnow_bool(bool value) => _sleepnow_bool = value;
}
