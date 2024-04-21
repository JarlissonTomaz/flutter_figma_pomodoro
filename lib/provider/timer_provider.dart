import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerProvider extends ChangeNotifier {
  Duration duration = const Duration(seconds: 10);
  bool isRunning = false;
  int ciclo = 0;
  int workingTime = 10;
  int restTime = 10;
  int tempoTrabalho = 0;
  int tempoDescanso = 0;
  int focusCount = 0;
  String dropWork = '';
  String dropRest = '';

  StreamSubscription<int>? _tickSubscription;

  void setCountdownDurationWork(int newDuration) {
    workingTime = newDuration;
    if (duration == const Duration(seconds: 0) || ciclo % 2 == 0) {
      duration = Duration(seconds: workingTime);
    }
    _tickSubscription?.cancel();
    isRunning = false;
    notifyListeners();
  }

  void setCountdownDurationRest(int newDuration) {
    restTime = newDuration;
    if (duration == const Duration(seconds: 0) || ciclo % 2 == 1) {
      duration = Duration(seconds: restTime);
    }
    _tickSubscription?.cancel();
    isRunning = false;
    notifyListeners();
  }

  void startStopTimer() {
    if (!isRunning) {
      _startTimer(duration.inSeconds);
    } else {
      _tickSubscription?.pause();
    }
    isRunning = !isRunning;
    notifyListeners();
  }

  void _startTimer(int seconds) {
    _tickSubscription?.cancel();
    _tickSubscription = Stream<int>.periodic(
            const Duration(seconds: 1), (sec) => seconds - sec - 1)
        .take(seconds)
        .listen((timeLeftInSeconds) {
      duration = Duration(seconds: timeLeftInSeconds);
      notifyListeners();
      if (timeLeftInSeconds == 0) {
        // Call the provided function when the timer ends
        timeIsUp();
        notifyListeners();
      }
    });
  }

  Text get timeLeftString {
    final minutes =
        ((duration.inSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds =
        (duration.inSeconds % 60).floor().toString().padLeft(2, '0');

    // Formata a string com horas, minutos e segundos
    return Text(
      '$minutes:$seconds',
      style: GoogleFonts.inter(
        fontSize: 23,
        color: Colors.white,
      ),
    );
  }

  void timeIsUp() {
    if (duration == const Duration(seconds: 0)) {
      ciclo++;
      if (ciclo % 2 == 0) {
        duration = Duration(seconds: workingTime);
        tempoTrabalho += workingTime;
      } else {
        duration = Duration(seconds: restTime);
        tempoDescanso += restTime;
        focusCount++;
      }
    }
  }

  void timeStop() {
    if (isRunning) {
      startStopTimer();
    }
    duration = const Duration(seconds: 0);
    timeIsUp();
    notifyListeners();
  }
}