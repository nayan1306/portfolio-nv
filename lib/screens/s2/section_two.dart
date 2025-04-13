import 'package:flutter/material.dart';

class SectionTwo extends StatelessWidget {
  const SectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final responsiveHeight = screenHeight * 1.3;

    return SizedBox(
      height: responsiveHeight,
      width: double.infinity,
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                  const Color.fromARGB(255, 239, 239, 239).withOpacity(0.6),
                ],
              ),
            ),
          ),

          // Main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Body
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.11,
                        top: screenHeight * 0.1,
                      ),
                      child: SizedBox(
                        width: screenWidth * 0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [const SizedBox(height: 20)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
