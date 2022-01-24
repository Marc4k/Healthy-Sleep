import 'package:flutter/material.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:healthy_sleep_finish/data/colors.dart';

//the gradient text for the App
Widget custom_text(String text, double fontsize, FontWeight fontWeight) {
  return GradientText(
    text: text,
    style: TextStyle(
      fontSize: fontsize,
      fontWeight: fontWeight,
      fontFamily: "Montserrat",
    ),
    colors: GradientColors.color_gradient,
    gradientDirection: GradientDirection.ttb,
  );
}

Widget custom_text_2(String text) {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.pink, Colors.green],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  return Text(
    'Hello Gradients!',
    style: new TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.bold,
        foreground: Paint()..shader = linearGradient),
  );
}

Widget custom_text_center(String text, double fontsize, FontWeight fontWeight) {
  return Center(
    child: GradientText(
      text: text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontFamily: "Montserrat",
      ),
      colors: GradientColors.color_gradient,
      gradientDirection: GradientDirection.ttb,
    ),
  );
}

Widget buttons_big_center(String text) {
  return Center(
    child: Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: CustomColors.background,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
              color: Colors.black38.withOpacity(0.4),
              blurRadius: 4,
              //  spreadRadius: 2,
              offset: Offset(0, 4)),
        ],
      ),
      child: Center(
        child: GradientText(
          colors: GradientColors.color_gradient,
          gradientDirection: GradientDirection.ttb,
          text: "$text",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: CustomColors.background,
            fontFamily: "Montserrat",
          ),
        ),
      ),
    ),
  );
}

Widget sleep_times(String time1, String time2, bool format24h) {
  if (format24h == true) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 118,
              height: 50,
              decoration: BoxDecoration(
                color: CustomColors.background,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38.withOpacity(0.4),
                      blurRadius: 4,
                      //  spreadRadius: 2,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Center(
                child: GradientText(
                  colors: GradientColors.color_gradient,
                  gradientDirection: GradientDirection.ttb,
                  text: "$time1",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: CustomColors.background,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 118,
              height: 50,
              decoration: BoxDecoration(
                color: CustomColors.background,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38.withOpacity(0.4),
                      blurRadius: 4,
                      //  spreadRadius: 2,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Center(
                child: GradientText(
                  colors: GradientColors.color_gradient,
                  gradientDirection: GradientDirection.ttb,
                  text: "$time2",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: CustomColors.background,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  } else {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                color: CustomColors.background,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38.withOpacity(0.4),
                      blurRadius: 4,
                      //  spreadRadius: 2,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Center(
                child: GradientText(
                  colors: GradientColors.color_gradient,
                  gradientDirection: GradientDirection.ttb,
                  text: "$time1",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: CustomColors.background,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                color: CustomColors.background,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38.withOpacity(0.4),
                      blurRadius: 4,
                      //  spreadRadius: 2,
                      offset: Offset(0, 4)),
                ],
              ),
              child: Center(
                child: GradientText(
                  colors: GradientColors.color_gradient,
                  gradientDirection: GradientDirection.ttb,
                  text: "$time2",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: CustomColors.background,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }
}

Widget gap_normal(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 50,
  );
}

Widget gap_big(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 15,
  );
}

Widget gap_custom(double size) {
  return SizedBox(
    height: size,
  );
}
