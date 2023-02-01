import 'package:flutter/material.dart';
import 'package:widgets/reuse_widgets.dart';

import 'data_classes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<SleepData> fakeData = [
    SleepData('Sun', 8.2),
    SleepData('Mon', 8),
    SleepData('Tue', 7),
    SleepData('Wed', 7.3),
    SleepData('Thu', 8.8),
    SleepData('Fri', 9.2),
    SleepData('Sat', 10),
  ];

  var loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod "
      "tempor incididunt ut labore et dolore magna aliqua.Lorem ipsum dolor sit amet, "
      "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna "
      "aliqua.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod "
      "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis "
      "nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis "
      "aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
      "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia "
      "deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TitleText(context, 'Home'),
        Row(
          children: [
            CircularProgressBar(context, 0.8, 'Sleep Goal', 'Today', Icons.bed),
            CircularProgressBar(
                context, 0.8, 'Sleep Goal', 'Today', Icons.mode_night_outlined),
          ],
        ),
        ChartWidget(context, fakeData, 'Sleep time of week'),
        Row(
          children: [
            ScoreWidget(context, 'Sleep score', 8.6, 'Weekly'),
            ScoreWidget(context, 'Average time', 6.4, 'Weekly'),
          ],
        ),
        MoodSlider(),
        NumberInputField(context, 'Whats your age?', numberController),
        TextInputField(context, controller, 'Enter password'),
        BlogWidget(context, 'First Blog', loremIpsum, 'ujjwal sharma'),
        BlogWidget(context, 'First Blog', loremIpsum, 'ujjwal sharma'),
        // ScoreWidget(context, 'Sleep depth score', 10, 'daily'),
      ],
    );
  }
}
