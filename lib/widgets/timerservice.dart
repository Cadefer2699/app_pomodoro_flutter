import 'dart:async';

import 'package:flutter/material.dart';

class TimeService extends ChangeNotifier {
  Timer? timer;  
  double currentDuration = 1500; 
  double selectedTime = 1500; 
  bool timerPlaying = false; 
  int rounds = 0; 
  int goal = 0; 
  String currentState = "FOCUS"; 

  void start() {
    timerPlaying = true; 
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentDuration == 0){
        hadleNextRound();
      } else {
        currentDuration--; 
        notifyListeners(); 
      }
    }); 
  }

  void pause() {
    timer!.cancel(); 
    timerPlaying = false; 
    notifyListeners(); 
  }

  void selectTime(double seconds) {
    selectedTime = seconds;  
    currentDuration = seconds; 
    notifyListeners(); 
  }

  void reset() {
    timer!.cancel(); 
    currentState = "FOCUS"; 
    currentDuration = selectedTime = 1500; 
    rounds = goal = 0; 
    timerPlaying = false; 
    notifyListeners(); 
  }
  
  void hadleNextRound() {
    if (currentState == "FOCUS" && rounds != 3){
      currentState = "BREAK"; 
      currentDuration = 300; 
      selectedTime = 300; 
      rounds++; 
      goal++; 
    } else if (currentState == "BREAK"){
      currentState = "FOCUS"; 
      currentDuration = 1500; 
      selectedTime = 1500; 

    } else if  (currentState == "FOCUS" && rounds == 3){
      currentState = "LONGBREAK"; 
      currentDuration = 1500; 
      selectedTime = 1500; 
      rounds++; 
      goal++; 
    } else if (currentState == "LONGBREAK"){
      currentState = "FOCUS"; 
      currentDuration = 1500; 
      selectedTime = 1500; 
      rounds = 0; 
    }
    notifyListeners(); 
  }

}