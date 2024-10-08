import 'package:app_pomodoro/utils.dart';
import 'package:app_pomodoro/widgets/progressWidget.dart';
import 'package:app_pomodoro/widgets/timeController.dart';
import 'package:app_pomodoro/widgets/timeoptions.dart';
import 'package:app_pomodoro/widgets/timercard.dart';
import 'package:app_pomodoro/widgets/timerservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pomodoroscreen extends StatelessWidget {
  const Pomodoroscreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TimeService>(context); 

    return Scaffold(
      backgroundColor: renderColor(provider.currentState), 
      appBar: AppBar(
        elevation:  0,
        backgroundColor: Colors.black, 
        title: Text(
          "Concentración Máxima", 
          style: textStyle(25, Colors.grey, FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.white
              ),
              iconSize: 35,
              onPressed: () {
                provider.reset();
              },
            )
          ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 15,), 
              Timercard(), 
              SizedBox(height: 35,), 
              TimeOptions(), 
              SizedBox(height: 35,), 
              TimeController(),
              SizedBox(height: 35,),  
              ProgressWidget(), 
            ],
          ),
        )
      ),
    );
  }
}