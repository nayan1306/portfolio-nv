import 'package:flutter/material.dart';

class SectionThree extends StatelessWidget {
  const SectionThree({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenHeight * 1.2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 28, 28, 28), Colors.black],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1),

            // Section Header
            SizedBox(height: screenHeight * 0.15),

            // Centered Dock
          ],
        ),
      ),
    );
  }
}
