import 'package:flutter/material.dart';
import 'package:flutter_figma_pomodoro/provider/timer_provider.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TimerReel extends StatefulWidget {
  const TimerReel({super.key});

  @override
  State<TimerReel> createState() => _TimerReelState();
}

class _TimerReelState extends State<TimerReel> {
  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<TimerProvider>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.width * 0.60,
            child: SleekCircularSlider(
              appearance: CircularSliderAppearance(
                size: MediaQuery.of(context).size.width * 0.84,
                customColors: CustomSliderColors(
                  dotColor: Colors.transparent,
                  trackColor: Colors.white,
                  progressBarColor: Colors.white,
                ),
                startAngle: 270,
                angleRange: 360,
                customWidths: CustomSliderWidths(
                  trackWidth: 4,
                  progressBarWidth: 4,
                ),
              ),
              min: 0,
              max: countdownProvider.ciclo % 2 == 0
                  ? double.parse(countdownProvider.workingTime.toString())
                  : double.parse(countdownProvider.restTime.toString()),
              initialValue: countdownProvider.duration.inSeconds.toDouble(),
              innerWidget: (percentage) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    countdownProvider.timeLeftString,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
