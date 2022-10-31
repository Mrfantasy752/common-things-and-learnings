import 'package:flutter/material.dart';
import 'package:flutter_application_1/riverpod/riverpod_trial.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'animationtrial.dart';
import 'riverpod/statenotifierprovider.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

final greetingsProvider = Provider<String>((ref) {
  return "Hello!";
});

void main() async {
  runApp(
    MaterialApp(
      home: ExampleWidget(),
    ),
  );
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    slotcalculate();
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("data")),
    );
  }

  slotcalculate() {
    // var noofminutes = Duration(hours: 2, minutes: 30).inMinutes;
    // print(noofminutes);
    var avgtime = 10;
    var format = DateFormat("HH:mm");
    var start = format.parse("11:30");
    var end = format.parse("12:00");
    Duration duration = start.difference(end).abs();
    // final hours = duration.inHours;
    final minutes = duration.inMinutes;
    var result = minutes / avgtime;
    print(' $minutes minutes $result');
  }
}
