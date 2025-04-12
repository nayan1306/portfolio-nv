import 'dart:ui';
import 'package:flutter/material.dart';

class GlassTile extends StatelessWidget {
  final double width;
  final double height;
  final Widget? child;

  const GlassTile({super.key, this.width = 200, this.height = 120, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 68, 68, 68).withOpacity(0.3),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child:
                child ??
                const Text(
                  'Glass Tile',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
