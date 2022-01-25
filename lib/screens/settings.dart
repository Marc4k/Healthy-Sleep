import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthy_sleep_finish/screens/Home.dart';
import 'package:healthy_sleep_finish/widgets/widget.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

int _value_time;
int _value_lan;
int _value_sleep;

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("format_24h") == true) {
      setState(() {
        _value_time = 1;
      });
    } else if (prefs.getBool("format_24h") == false) {
      setState(() {
        _value_time = 2;
      });
    } else {
      setState(() {
        _value_time = 1;
      });
    }
    _value_sleep = prefs.getInt("fall_asleep") + 1;
    _value_lan = prefs.getInt("language");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2D2E40),
          elevation: 0,
        ),
        backgroundColor: Color(0xFF2D2E40),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(23, 10, 23, 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              custom_text("${Text("settings").data.tr()}", 36, FontWeight.w800),
              Divider(),
              gap_custom(22),
              Row(
                children: [
                  custom_text(
                      "${Text("time_format").data.tr()}", 18, FontWeight.w400),
                  Spacer(),
                  DropdownButton(
                    dropdownColor: Color(0xFF2D2E40),
                    value: _value_time,
                    items: [
                      DropdownMenuItem(
                        child: custom_text("24h", 15, FontWeight.w400),
                        value: 1,
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("format_24h", true);
                          viewBloc.timepickertSink.add(helper.format_24h);
                          helper.format_24h = true;
                        },
                      ),
                      DropdownMenuItem(
                        child: custom_text("12h", 15, FontWeight.w400),
                        value: 2,
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("format_24h", false);
                          viewBloc.timepickertSink.add(helper.format_24h);
                          helper.format_24h = false;
                        },
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value_time = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                children: [
                  custom_text(
                      "${Text("language").data.tr()}", 18, FontWeight.w400),
                  Spacer(),
                  DropdownButton(
                    dropdownColor: Color(0xFF2D2E40),
                    value: _value_lan,
                    items: [
                      DropdownMenuItem(
                        child: custom_text(
                            "${Text("language_english").data.tr()}",
                            15,
                            FontWeight.w400),
                        value: 1,
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setInt("language", 1);
                          context.locale = Locale("en", "US");
                        },
                      ),
                      DropdownMenuItem(
                        child: custom_text(
                            "${Text("language_german").data.tr()}",
                            15,
                            FontWeight.w400),
                        value: 2,
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setInt("language", 2);

                          context.locale = Locale("de", "DE");
                        },
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value_lan = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  custom_text("${Text("fall_sleep_time").data.tr()}", 18,
                      FontWeight.w400),
                  Spacer(),
                  DropdownButton(
                    value: _value_sleep,
                    dropdownColor: Color(0xFF2D2E40),
                    onTap: () {
                      print("$_value_sleep");
                    },
                    items: [
                      DropdownMenuItem(
                        child: custom_text("10min", 15, FontWeight.w400),
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          helper.fall_asleep = 0;
                          prefs.setInt("fall_asleep", helper.fall_asleep);
                        },
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: custom_text("15min", 15, FontWeight.w400),
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          helper.fall_asleep = 1;
                          prefs.setInt("fall_asleep", helper.fall_asleep);
                        },
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: custom_text("20min", 15, FontWeight.w400),
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          helper.fall_asleep = 2;
                          prefs.setInt("fall_asleep", helper.fall_asleep);
                        },
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: custom_text("25min", 15, FontWeight.w400),
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          helper.fall_asleep = 3;
                          prefs.setInt("fall_asleep", helper.fall_asleep);
                        },
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: custom_text("30min", 15, FontWeight.w400),
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          helper.fall_asleep = 4;
                          prefs.setInt("fall_asleep", helper.fall_asleep);
                        },
                        value: 5,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value_sleep = value;
                      });
                    },
                  ),
                ],
              ),
              gap_normal(context),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/information"),
                child: Row(
                  children: [
                    custom_text("${Text("information").data.tr()}", 18,
                        FontWeight.w400),
                    Spacer(),
                    Icon(
                      Icons.open_in_new_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              gap_normal(context),
              GestureDetector(
                onTap: () => launch(
                    "https://github.com/Marc4k/privacy/blob/main/healthy-sleep-privacy-policy.md"),
                child: Row(
                  children: [
                    custom_text(
                        "${Text("daten").data.tr()}", 18, FontWeight.w400),
                    Spacer(),
                    Icon(
                      Icons.open_in_new_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              gap_normal(context),
              Spacer(),
              Center(
                child: Text(
                  "by Marc & Nathalie",
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Made in Austria",
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
