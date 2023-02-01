import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'data_classes.dart';

Color darkGrey = Colors.grey.shade900;
Color textColor = Colors.grey.shade500;
Color primaryColor = Colors.deepPurple;

double borderRadius = 6;

Color colorFinder(double value) {
  Color ans;
  if (value > 7.5) {
    ans = Colors.green.shade700;
  } else if (value > 6) {
    ans = Colors.orange.shade800;
  } else {
    ans = Colors.red.shade700;
  }
  return ans;
}

Widget CircularProgressBar(BuildContext context, double value, String title,
    String subTitle, IconData progressIcon) {
  Color valueColor = colorFinder(value * 10);

  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width / 2.13;

  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
    child: Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: darkGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: value),
                duration: Duration(seconds: 1),
                builder: (context, value, child) => SizedBox(
                  width: 60,
                  height: 60,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: value,
                        strokeWidth: 8,
                        color: valueColor,
                      ),
                      Icon(
                        progressIcon,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              subTitle.toString(),
              style: TextStyle(
                fontSize: 14,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget NumberInputField(
    BuildContext context, String hintText, TextEditingController controller) {
  Color textColor = Colors.grey.shade500;

  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius), color: darkGrey),
      child: TextField(
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: TextStyle(color: textColor, fontSize: 16),
        ),
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
          TextInputFormatter.withFunction(
            (oldValue, newValue) => newValue.copyWith(
              text: newValue.text.replaceAll(',', '.'),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget DrawerWidget(BuildContext context) {
  Color textColor = Colors.grey.shade500;

  final user = FirebaseAuth.instance.currentUser!;

  return Drawer(
    backgroundColor: darkGrey,
    child: ListView(
      children: [
        DrawerHeader(
          child: Text(
            'Better Sleep',
            style: TextStyle(fontSize: 25, color: textColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Signed in as ' + user.email!,
            style: TextStyle(fontSize: 18, color: textColor),
          ),
        ),
        Divider(
          color: textColor,
        ),
        ListTile(
          title: Text(
            'Settings',
            style: TextStyle(fontSize: 18, color: textColor),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/SettingsPage');
          },
        ),
        ListTile(
          title: Text(
            'Logout',
            style: TextStyle(fontSize: 18, color: textColor),
          ),
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    ),
  );
}

Widget ChartWidget(BuildContext context, List<SleepData> data, String title) {
  Color textColor = Colors.grey.shade500;

  double borderRadius = 6;
  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Container(
      height: height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius), color: darkGrey),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
            text: title, textStyle: TextStyle(color: textColor, fontSize: 14)),
        enableAxisAnimation: true,
        tooltipBehavior: TooltipBehavior(enable: true),

        // legend: Legend(isVisible: true),
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<SleepData, String>>[
          LineSeries(
              width: 3,
              dataSource: data,
              xValueMapper: (SleepData time, _) => time.date,
              yValueMapper: (SleepData time, _) => time.time)
        ],
      ),
    ),
  );
}

Widget TextInputField(
    BuildContext context, TextEditingController controller, String hintText) {
  Color textColor = Colors.grey.shade500;

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius), color: darkGrey),
        child: TextField(
          controller: controller,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(color: textColor, fontSize: 16),
          ),
        ),
      ));
}

Widget BlogWidget(BuildContext context, String blogTitle, String blogContent,
    String blogAuthorName) {
  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width;

  Color textColor = Colors.grey.shade500;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Container(
      width: width * 0.95,
      // height: height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: darkGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              blogTitle,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w500, color: textColor),
            ),
            Divider(
              color: textColor,
            ),
            Text(
              blogContent,
              style: TextStyle(color: textColor, fontSize: 17),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'By $blogAuthorName',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget ScoreWidget(BuildContext context, String heading, double sleepScore,
    String dayWeekMonthly) {
  Size size = MediaQuery.of(context).size;
  double height = size.height;
  double width = size.width / 2.13;

  Color sleepScoreColor = colorFinder(sleepScore);

  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
    child: Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        color: darkGrey,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading.toString(),
            style: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sleepScore.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: sleepScoreColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: Colors.blue.shade400,
                  size: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dayWeekMonthly.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget TitleText(BuildContext context, String pageHeading) {
  Color grey = Colors.grey.shade500;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Column(
      children: [
        // Divider(color: grey,),
        Text(
          pageHeading,
          style: TextStyle(
            color: grey,
            fontSize: 35,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

Widget ComingSoon(BuildContext context) {
  Color grey = Colors.grey.shade500;
  return Text(
    'Coming\n  Soon!',
    style: TextStyle(fontSize: 40, color: grey),
  );
}

class MoodSlider extends StatefulWidget {
  const MoodSlider({Key? key}) : super(key: key);

  @override
  State<MoodSlider> createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  int _value = 5;
  Color primary = const Color.fromRGBO(46, 56, 130, 1);

  Color textColor = Colors.grey.shade500;
  // Color buttonColor = Colors.grey.shade500;
  MaterialStateProperty<Color?> buttonColor =
      MaterialStateProperty.all(const Color.fromRGBO(46, 56, 130, 1));
  MaterialStateProperty<Color?> buttonTextColor =
      MaterialStateProperty.all(Colors.grey.shade400);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height * 0.3;
    double width = size.width * 0.95;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        width: width,
        height: height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          color: darkGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'How are you feeling?',
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                ),
              ),
              // SizedBox(height: 10,),
              Expanded(
                child: Slider(
                  value: _value.toDouble(),
                  min: 0,
                  max: 10,
                  divisions: 10,
                  activeColor: primary,
                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue.round();
                    });
                  },
                ),
              ),
              // SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bad',
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Okay',
                    style: TextStyle(
                      color: Colors.orange.shade400,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Good',
                    style: TextStyle(
                      color: Colors.green.shade400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
