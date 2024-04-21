import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Text(
              '00:50',
              style: GoogleFonts.inter(
                fontSize: 64,
                fontWeight: FontWeight.w200,
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 60),
                GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.skip_next_rounded,
                  size: 48,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle_outlined),
                SizedBox(width: 10),
                Icon(Icons.circle_outlined),
                SizedBox(width: 10),
                Icon(Icons.circle_outlined),
                SizedBox(width: 10),
                Icon(Icons.circle_outlined),
              ],
            ),
            const SizedBox(height: 100),
            Text(
              'Focus Time',
              style: GoogleFonts.inter(
                fontSize: 23,
              ),
            ),
            const SizedBox(height: 150),
            const Icon(Icons.check)
          ],
        ),
      ),
    );
  }
}
