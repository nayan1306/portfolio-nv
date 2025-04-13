import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';

class BlackCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;
  final String subtitle;

  const BlackCard({
    super.key,
    required this.width,
    required this.height,
    this.child,
    this.subtitle = "Explore more",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tilt(
        borderRadius: BorderRadius.circular(24),
        tiltConfig: TiltConfig(
          angle: 15.0,
          // direction: const [TiltDirection.front],
          enableGestureSensors:
              !kIsWeb && (Platform.isAndroid || Platform.isIOS),
          enableReverse: true,
          filterQuality: FilterQuality.medium,
          enableGestureHover: true,
          enableGestureTouch: true,
          enableRevert: true,
          moveDuration: const Duration(milliseconds: 120),
          leaveDuration: const Duration(milliseconds: 350),
          moveCurve: Curves.easeOutCubic,
          leaveCurve: Curves.easeOut,
          sensorFactor: 8.0,
          // enableGestureSensors: true,
          enableSensorRevert: true,
          sensorRevertFactor: 0.08,
        ),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Main content
              Expanded(
                child: Center(
                  child:
                      child ??
                      const Text(
                        'Black Card',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                ),
              ),
              // Bottom subtitle
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
