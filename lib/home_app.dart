import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFFBA4949),
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
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 50,
                      color: Color(0xFFBA4949),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.skip_next_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Row(
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
              'Focus Time',
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
