import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox buildAnimatedIntroText(double screenWidth) {
  // Responsive width logic
  double boxWidth;
  double fontSize;

  if (screenWidth < 600) {
    // Mobile
    boxWidth = screenWidth * 0.85;
    fontSize = 14;
  } else if (screenWidth < 1100) {
    // Tablet
    boxWidth = screenWidth * 0.65;
    fontSize = 16;
  } else {
    // Desktop
    boxWidth = screenWidth * 0.28;
    fontSize = 18;
  }

  return SizedBox(
    width: boxWidth,
    child: DefaultTextStyle(
      style: GoogleFonts.orbitron(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: const Color.fromARGB(197, 255, 255, 255),
        letterSpacing: 1.8,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            "Crafting pixel-perfect Flutter apps with precision and creativity. "
            "I'm driven by innovation, constantly exploring new technologies. "
            "Building seamless and intuitive experiences, one widget at a time.",
            speed: const Duration(milliseconds: 50),
          ),
        ],
        repeatForever: true,
        pause: const Duration(milliseconds: 3000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    ),
  );
}
