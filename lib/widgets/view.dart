import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:healthy_sleep_finish/data/counter_bloc.dart';
import 'package:healthy_sleep_finish/data/sleep_helper.dart';
import 'package:healthy_sleep_finish/screens/Home.dart';
import 'package:healthy_sleep_finish/widgets/widget.dart';

import 'package:easy_localization/easy_localization.dart';

final viewBloc = ViewBloc();

class View extends StatefulWidget {
  @override
  _ViewState createState() => _ViewState();
}

String test = Text("sleepnow").data.tr();
DateTime now = DateTime.now();
DateTime actuell_time = DateTime(now.year, now.month, now.day, 6, 0);

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    if (helper.sleepnow_bool == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Der Sleep Better Text
          custom_text_center(
              "${Text("sleepnow_time").data.tr()}", 36, FontWeight.w800),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: custom_text_center(
                "${Text("sleepnow").data.tr()}", 14, FontWeight.w400),
          ),
          gap_custom(15),
          //die Aktuelle Zeit

          sleep_times("${sleepnow(6, helper.format_24h)}",
              "${sleepnow(5, helper.format_24h)}", helper.format_24h),
          sleep_times("${sleepnow(4, helper.format_24h)}",
              "${sleepnow(3, helper.format_24h)}", helper.format_24h),
          sleep_times("${sleepnow(2, helper.format_24h)}",
              "${sleepnow(1, helper.format_24h)}", helper.format_24h),
          gap_custom(15),
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 55, 0),
            child: custom_text_center(
                "${Text("sleep_cycels").data.tr()}", 14, FontWeight.w400),
          ),
          gap_custom(40),

          GestureDetector(
              onTap: () {
                setbool();
              },
              child: buttons_big_center("${Text("back_button").data.tr()}")),
          gap_normal(context),
          //   margin: EdgeInsets.fromLTRB(80, 5, 80, 5),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Der Sleep Better Text
          custom_text_center(
              "${Text("sleeplater_time").data.tr()}", 36, FontWeight.w800),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: custom_text_center(
                "${Text("sleeplater_1").data.tr()} ${formate_time(newTime, helper.format_24h)}${Text("sleeplater_2").data.tr()} ",
                14,
                FontWeight.w400),
          ),
          gap_custom(15),
          //die Aktuelle Zeit

          sleep_times(
              "${sleeplater(6, newTime, helper.format_24h, helper.fall_asleep)}",
              "${sleeplater(5, newTime, helper.format_24h, helper.fall_asleep)}",
              helper.format_24h),
          sleep_times(
              "${sleeplater(4, newTime, helper.format_24h, helper.fall_asleep)}",
              "${sleeplater(3, newTime, helper.format_24h, helper.fall_asleep)}",
              helper.format_24h),
          sleep_times(
              "${sleeplater(2, newTime, helper.format_24h, helper.fall_asleep)}",
              "${sleeplater(1, newTime, helper.format_24h, helper.fall_asleep)}",
              helper.format_24h),
          gap_custom(15),
          Padding(
            padding: const EdgeInsets.fromLTRB(55, 0, 55, 0),
            child: custom_text_center(
                "${Text("sleep_cycels").data.tr()}", 14, FontWeight.w400),
          ),
          gap_custom(40),

          GestureDetector(
              onTap: () {
                setbool();
              },
              child: buttons_big_center("${Text("back_button").data.tr()}")),
          gap_normal(context),
          //   margin: EdgeInsets.fromLTRB(80, 5, 80, 5),
        ],
      );
    }
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        custom_text_center(
            "${Text("sleepnow_time").data.tr()}", 30, FontWeight.w800),
        gap_normal(context),
        GestureDetector(
            onTap: () {
              setbool();
              helper.sleepnow_bool = true;
            },
            child: buttons_big_center("${Text("sleep_showtime").data.tr()}")),
        gap_big(context),
        custom_text_center(
            "${Text("sleeplater_time").data.tr()}", 30, FontWeight.w800),
        gap_normal(context),
        TimePickerSpinner(
            minutesInterval: 5,
            highlightedTextStyle: TextStyle(fontSize: 24, color: Colors.white),
            alignment: Alignment.center,
            normalTextStyle: TextStyle(fontSize: 24, color: Colors.grey),
            itemHeight: 40,
            time: actuell_time,
            is24HourMode: helper.format_24h,
            isForce2Digits: true,
            onTimeChange: (time) {
              newTime = time;
            }),
        gap_normal(context),
        GestureDetector(
            onTap: () {
              setbool();
              helper.sleepnow_bool = false;
            },
            child: buttons_big_center("${Text("sleep_showtime").data.tr()}")),
        gap_normal(context),
      ],
    );
  }
}
