import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionSix extends StatelessWidget {
  const SectionSix({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.7,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 16, 16, 16),
            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.1),

            // Section Header
            Text(
              "Achievements",
              style: GoogleFonts.robotoCondensed(
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Milestones That Matter.",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: const Color.fromARGB(221, 120, 120, 120),
                fontWeight: FontWeight.w400,
                fontSize: 20,
                letterSpacing: 1.2,
              ),
            ),

            SizedBox(height: screenHeight * 0.1),

            // First Row of Cards
            SizedBox(height: screenHeight * 0.15),
          ],
        ),
      ),
    );
  }
}
