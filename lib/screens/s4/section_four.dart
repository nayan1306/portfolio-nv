import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/screens/s2/widgets/black_card.dart';
import 'package:portfolio_website/screens/s2/widgets/tools_and_technologies.dart';

class SectionFour extends StatelessWidget {
  const SectionFour({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenHeight * 2.2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
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
              "Certifications",
              style: GoogleFonts.robotoCondensed(
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 90,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Stacked with certs. Fueled by curiosity. Here’s proof I’m built for the future.",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black87,
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
