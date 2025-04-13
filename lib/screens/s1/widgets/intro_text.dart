import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox buildAnimatedIntroText(double screenWidth) {
  return SizedBox(
    width: screenWidth * 0.28,
    child: DefaultTextStyle(
      style: GoogleFonts.orbitron(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color.fromARGB(197, 255, 255, 255),
        letterSpacing: 1.8,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            "Crafting pixel-perfect Flutter apps with precision and creativity. I'm driven by innovation, constantly exploring new technologies. Building seamless and intuitive experiences, one widget at a time.",
            speed: const Duration(milliseconds: 50),
          ),
          // TypewriterAnimatedText(
          //   "I'm driven by innovation, constantly exploring new technologies.",
          //   speed: const Duration(milliseconds: 50),
          // ),
          // TypewriterAnimatedText(
          //   'Building seamless and intuitive experiences, one widget at a time.',
          //   speed: const Duration(milliseconds: 50),
          // ),
        ],
        repeatForever: true,
        pause: const Duration(milliseconds: 3000),
        onTap: () {
          print("Tap Event");
        },
      ),
    ),
  );
}
