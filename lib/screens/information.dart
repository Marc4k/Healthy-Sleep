import 'package:flutter/material.dart';
import 'package:healthy_sleep_finish/data/colors.dart';
import 'package:healthy_sleep_finish/widgets/widget.dart';
import 'package:easy_localization/easy_localization.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.background,
        elevation: 0,
      ),
      backgroundColor: CustomColors.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 10, 23, 23),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              custom_text("INFORMATION.", 36, FontWeight.w800),
              Divider(),
              gap_custom(22),
              custom_text(
                  "${Text("sleep_cycle_inf").data.tr()}", 24, FontWeight.w800),
              gap_custom(5),
              custom_text("${Text("sleep_cycle_inf_4").data.tr()}", 18,
                  FontWeight.w400),
              gap_custom(22),
              custom_text(
                  "${Text("sleep_time_inf").data.tr()}", 24, FontWeight.w800),
              gap_custom(5),
              custom_text(
                  "${Text("sleep_time_inf_1").data.tr()}", 18, FontWeight.w400),
              gap_custom(25),
              custom_text(
                  "${Text("sleep_tipps_inf").data.tr()}", 24, FontWeight.w800),
              gap_custom(5),
              custom_text("${Text("sleep_tipps_inf_1").data.tr()}", 18,
                  FontWeight.w400),
              custom_text("${Text("sleep_tipps_inf_2").data.tr()}", 18,
                  FontWeight.w400),
              custom_text("${Text("sleep_tipps_inf_3").data.tr()}", 18,
                  FontWeight.w400),
            ],
          ),
        ),
      ),
    );
  }
}
