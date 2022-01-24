import 'package:intl/intl.dart';
import 'package:date_time_format/date_time_format.dart';

//for sleep later
String sleeplater(int cycel, DateTime time, bool format_24h, int sleep_intime) {
  for (int i = 0; i < cycel; i++) {
    time = time.subtract(const Duration(hours: 1, minutes: 30));
  }
  switch (sleep_intime) {
    case 0:
      time = time.subtract(const Duration(minutes: 10));
      break;

    case 1:
      time = time.subtract(const Duration(minutes: 15));
      break;

    case 2:
      time = time.subtract(const Duration(minutes: 20));
      break;

    case 3:
      time = time.subtract(const Duration(minutes: 25));
      break;

    case 4:
      time = time.subtract(const Duration(minutes: 30));
      break;
  }

  if (format_24h == true) {
    String formattedTime = DateFormat.Hm().format(time);
    return formattedTime;
  } else {
    String formattedTime = (DateTimeFormat.format(time, format: r'g:i a'));
    return formattedTime;
  }
}

//for sleep now
String sleepnow(int cycel, bool format_24h) {
  DateTime now = DateTime.now();
  now = now.add(const Duration(minutes: 15));
  for (int i = 0; i < cycel; i++) {
    now = now.add(const Duration(hours: 1, minutes: 30));
  }
  print("$now");

  if (format_24h == true) {
    String formattedTime = DateFormat.Hm().format(now);

    return formattedTime;
  } else {
    String formattedTime = (DateTimeFormat.format(now, format: r'g:i a'));
    return formattedTime;
  }
}

//only formating DateTime to a string
String formate_time(DateTime time, bool format_24h) {
  if (format_24h == true) {
    String formattedTime = DateFormat.Hm().format(time);
    return formattedTime;
  } else {
    String formattedTime = (DateTimeFormat.format(time, format: r'g:i a'));
    return formattedTime;
  }
}

//only gives the current time back

String current_time(bool format_24h) {
  DateTime now = DateTime.now();

  if (format_24h == true) {
    String formattedTime = DateFormat.Hm().format(now);
    return formattedTime;
  } else {
    String formattedTime = (DateTimeFormat.format(now, format: r'g:i A'));
    return formattedTime;
  }
}
