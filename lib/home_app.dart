import 'package:flutter/material.dart';
import 'package:flutter_figma_pomodoro/provider/timer_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_figma_pomodoro/timer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
      backgroundColor: countdownProvider.ciclo % 2 == 0
          ? const Color(0xFFBA4949)
          : countdownProvider.focusCount == 7
              ? const Color.fromARGB(255, 57, 112, 151)
              : const Color.fromARGB(255, 56, 133, 138),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            const TimerReel(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 60),
                GestureDetector(
                  onTap: () {
                    countdownProvider.startStopTimer();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: !countdownProvider.isRunning
                        ? Icon(
                            Icons.play_arrow_rounded,
                            size: 50,
                            color: countdownProvider.ciclo % 2 == 0
                                ? const Color(0xFFBA4949)
                                : countdownProvider.focusCount == 7
                                    ? const Color.fromARGB(255, 57, 112, 151)
                                    : const Color.fromARGB(255, 56, 133, 138),
                          )
                        : Icon(
                            Icons.pause_rounded,
                            size: 50,
                            color: countdownProvider.ciclo % 2 == 0
                                ? const Color(0xFFBA4949)
                                : countdownProvider.focusCount == 7
                                    ? const Color.fromARGB(255, 57, 112, 151)
                                    : const Color.fromARGB(255, 56, 133, 138),
                          ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {
                      countdownProvider.timeStop();
                    },
                    icon: const Icon(
                      Icons.skip_next_rounded,
                      size: 50,
                      color: Colors.white,
                    )),
              ],
            ),
            const SizedBox(height: 40),
            countdownProvider.focusCount == 1 ||
                    countdownProvider.focusCount == 2
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.circle_outlined,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  )
                : countdownProvider.focusCount == 3 ||
                        countdownProvider.focusCount == 4
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.circle_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ],
                      )
                    : countdownProvider.focusCount == 5 ||
                            countdownProvider.focusCount == 6
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 28,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.circle_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            ],
                          )
                        : countdownProvider.focusCount == 7
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ],
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.circle_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ],
                              ),
            const SizedBox(height: 80),
            Text(
              countdownProvider.ciclo % 2 == 0
                  ? 'Focus Time'
                  : countdownProvider.focusCount == 7
                      ? 'Long Break'
                      : 'Short Break',
              style: GoogleFonts.inter(
                fontSize: 27,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 80),
            const Icon(
              Icons.flag_circle_rounded,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
