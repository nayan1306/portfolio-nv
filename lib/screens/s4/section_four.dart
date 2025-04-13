import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/screens/s4/widgets/glass_card_placeholder.dart';

class SectionFour extends StatelessWidget {
  const SectionFour({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: screenHeight * 1.58,
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

            SizedBox(height: screenHeight * 0.05),

            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.5, // increased ratio for smaller cards
              children: [
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(2).png',
                  label: 'Machine Learning',
                ),
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(5).png',
                  label: 'Deep Learning',
                ),
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(8).png',
                  label: 'AI for Everyone',
                ),
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(9).png',
                  label: 'Data Analytics',
                ),
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(3).png',
                  label: 'Computer Vision',
                ),
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(4).png',
                  label: 'Python Programming',
                ),
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(1).png',
                  label: 'Data Analytics',
                ),
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(6).png',
                  label: 'Computer Vision',
                ),
                GlassCertificateCard(
                  imageUrl:
                      'https://raw.githubusercontent.com/nayan1306/assets/refs/heads/main/portfolio/c%20(7).png',
                  label: 'Python Programming',
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.15),
          ],
        ),
      ),
    );
  }
}
