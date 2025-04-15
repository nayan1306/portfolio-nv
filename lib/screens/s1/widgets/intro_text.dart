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
    fontSize = 12;
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
      style: GoogleFonts.audiowide(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: const Color.fromARGB(255, 138, 138, 138),
        letterSpacing: 1.8,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            "Engineering high-performance Flutter apps with pixel-perfect precision and architectural finesse. Passionate about scalable design systems and pushing the boundaries of what's possible.",
            speed: const Duration(milliseconds: 50),
          ),
          TypewriterAnimatedText(
            "Harnessing the power of AI and computer vision to build intelligent systems that interpret, analyze, and respond to the visual world with precision and purpose.",
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
