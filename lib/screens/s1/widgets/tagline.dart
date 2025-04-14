import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_effects/hyper_effects.dart';

class TagLine extends StatefulWidget {
  const TagLine({super.key});

  @override
  State<TagLine> createState() => _TagLineState();
}

class _TagLineState extends State<TagLine> {
  final List<String> tagLines = [
    'Integrity',
    'Curiosity',
    'Purpose',
    'Compassion',
    'Gratitude',
    'Empathy',
    'Wisdom',
    'Kindness',
    'Growth',
  ];

  int tagLine = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      Duration(milliseconds: (1800 * timeDilation).toInt()),
      (_) {
        setState(() {
          tagLine = (tagLine + 1) % tagLines.length;
        });
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font sizes
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1100;

    double baseFontSize = isMobile ? 10 : (isTablet ? 18 : 20);
    double tagFontSize = isMobile ? 12 : (isTablet ? 22 : 25);
    double leftPadding = isMobile ? 10 : 16;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Driven by',
          style: GoogleFonts.robotoMono().copyWith(
            color: Colors.grey,
            fontSize: baseFontSize,
            fontWeight: FontWeight.w600,
          ),
          strutStyle: StrutStyle(
            fontSize: baseFontSize,
            height: 1,
            forceStrutHeight: true,
            leading: 1,
          ),
        ),
        ShaderMask(
          shaderCallback:
              (rect) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white.withOpacity(0),
                ],
              ).createShader(rect),
          child: ShaderMask(
            shaderCallback:
                (rect) => const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 104, 104, 104),
                    Color.fromARGB(255, 231, 231, 231),
                    Colors.white,
                    Color.fromARGB(255, 82, 82, 82),
                  ],
                ).createShader(rect),
            child: Text(
                  tagLines[tagLine],
                  style: GoogleFonts.gloriaHallelujah().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: tagFontSize,
                  ),
                )
                .roll(
                  symbolDistanceMultiplier: 2,
                  tapeSlideDirection: TextTapeSlideDirection.down,
                  tapeCurve: Curves.easeInOutCubic,
                  widthCurve: Curves.easeOutCubic,
                  widthDuration: const Duration(milliseconds: 1000),
                  padding: EdgeInsets.only(left: leftPadding),
                )
                .animate(
                  trigger: tagLine,
                  duration: const Duration(milliseconds: 1000),
                ),
          ),
        ),
      ],
    );
  }
}
