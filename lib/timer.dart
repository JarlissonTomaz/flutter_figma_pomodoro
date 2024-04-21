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
  var _isTimerOn = false;

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 18, 24, 39),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.width * 0.80,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  size: MediaQuery.of(context).size.width * 0.84,
                  customColors: CustomSliderColors(
                    dotColor: Colors.transparent,
                    trackColors: [
                      const Color.fromARGB(255, 59, 64, 87),
                      const Color.fromARGB(26, 71, 71, 71)
                    ],
                    progressBarColors: [
                      const Color.fromARGB(255, 102, 112, 219),
                      const Color.fromARGB(255, 77, 92, 255),
                    ],
                    shadowColor: Colors.grey.shade600,
                  ),
                  startAngle: 270,
                  angleRange: 360,
                  customWidths: CustomSliderWidths(
                    trackWidth: 10,
                    progressBarWidth: 10,
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
                      const SizedBox(height: 20),
                      countdownProvider.timeLeftString,
                      const Text(
                        "Work",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 102, 112, 219),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (_isTimerOn) {
                  setState(() {
                    _isTimerOn = false;
                  });
                } else {
                  _isTimerOn = true;
                  countdownProvider.startStopTimer();
                }
              },
              child: SizedBox(
                height: 70,
                width: 70,
                child: countdownProvider.isRunning
                    ? Image.asset('lib/icons/pause_button.png')
                    : Image.asset('lib/icons/play_button.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
