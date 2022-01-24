import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:healthy_sleep_finish/data/colors.dart';
import 'package:healthy_sleep_finish/data/counter_bloc.dart';
import 'package:healthy_sleep_finish/data/sleep_helper.dart';
import 'package:healthy_sleep_finish/data/variable_helper.dart';
import 'package:healthy_sleep_finish/widgets/gradient_icon.dart';
import 'package:healthy_sleep_finish/widgets/view.dart';
import 'package:healthy_sleep_finish/widgets/widget.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

final viewBloc = ViewBloc();
bool test = true;

DateTime newTime = DateTime.now();
DateTime now = DateTime.now();
DateTime clock_spinner;
final helper = Variable_helper();

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: CustomColors.background2));
    getData();
    String time = "";
    Timer _everySecond;
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      viewBloc.timetSink.add(time);
      time = current_time(true);
    });

    super.initState();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get("welcome") == null) {
      setState(() {
        prefs.setBool("format_24h", helper.format_24h);
        prefs.setInt("fall_asleep", helper.fall_asleep);
        prefs.setInt("language", helper.language);
        prefs.setBool("welcome", true);
      });
    } else {
      setState(() {
        helper.format_24h = prefs.getBool("format_24h");
        helper.fall_asleep = prefs.getInt("fall_asleep");
        helper.language = prefs.getInt("language");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 23, 5, 0),
              child: Row(
                children: [
                  custom_text("SLEEP BETTER.", 36, FontWeight.w800),
                  Spacer(),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(context, "/settings");
                      setState(() {});
                    },
                    child: GradientIcon(
                      Icons.settings,
                      30,
                      LinearGradient(
                        colors: <Color>[
                          Colors.white,
                          Color(0xFFBBCEFE),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: StreamBuilder<Object>(
                  stream: viewBloc.timeStream,
                  builder: (context, snapshot) {
                    return custom_text("${current_time(helper.format_24h)}", 18,
                        FontWeight.w500);
                  }),
            ),
            gap_big(context),
            StreamBuilder<Object>(
                stream: viewBloc.viewStream,
                builder: (context, snapshot) {
                  return AnimatedCrossFade(
                      firstChild: MainPage(),
                      secondChild: View(),
                      crossFadeState: test
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 200));
                }),
            Spacer(),
            Image.asset(
              "assets/moon.png",
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}

void setbool() {
  viewBloc.viewtSink.add(test);
  test = !test;
}
