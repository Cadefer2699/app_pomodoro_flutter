

import 'package:app_pomodoro/utils.dart';
import 'package:app_pomodoro/widgets/timerservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TimeService>(context); 

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${provider.rounds}/4", 
              style: textStyle(30, const Color.fromARGB(255, 240, 240, 240), FontWeight.bold),), 
            Text(
              "${provider.goal}/12", 
              style: textStyle(30, const Color.fromARGB(255, 240, 240, 240), FontWeight.bold),)
          ],
        ), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("ROUND", style: textStyle(28, const Color.fromARGB(255, 240, 240, 240), FontWeight.bold),), 
            Text("GOALD", style: textStyle(28, const Color.fromARGB(255, 240, 240, 240), FontWeight.bold),)
          ],
        )
      ],
    ); 
  }
}