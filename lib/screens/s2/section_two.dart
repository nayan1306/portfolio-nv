import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/screens/s2/widgets/long_card_1.dart';
import 'package:portfolio_website/screens/s2/widgets/long_card_2.dart';
import 'package:portfolio_website/screens/s2/widgets/mobile_tools_and_technologies.dart';
import 'package:portfolio_website/screens/s2/widgets/short_card_1.dart';
import 'package:portfolio_website/screens/s2/widgets/short_card_2.dart';
import 'package:portfolio_website/screens/s2/widgets/tools_and_technologies.dart';

class SectionTwo extends StatelessWidget {
  const SectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width < 1000 && !isMobile;

    // Calculate the height based on device type
    double sectionHeight =
        isMobile
            ? screenSize.height *
                3.0 // More space on mobile
            : isTablet
            ? screenSize.height *
                2.8 // Less space on tablet
            : screenSize.height * 2.4; // Default for desktop

    return Container(
      width: double.infinity,
      height: sectionHeight,
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
              !isMobile ? "Remarkable Projects" : 'Projects',
              style: GoogleFonts.robotoCondensed(
                textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      isMobile
                          ? 38
                          : isTablet
                          ? 58
                          : 90,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Here are some of my hand-picked creations that reflect my passion and problem-solving skills. More on GitHub!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize:
                    isMobile
                        ? 14
                        : isTablet
                        ? 16
                        : 20,
                letterSpacing: 1.2,
              ),
            ),

            SizedBox(height: screenHeight * 0.1),

            // First Row of Cards (Mobile will show in single column)
            isMobile
                ? Column(
                  children: [
                    LongCard1(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                      title: "ByG⧋ZE",
                      description: "AI powered learning management system",
                      imagePath: "assets/card_icons/bygaze.png",
                      linkUrl: "https://your-link.com",
                    ),
                    const SizedBox(height: 20),
                    LongCard2(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                      title: "VaayuSphere",
                      description:
                          "A web-based air quality monitoring and complaning system",
                      imagePath: "assets/card_icons/vaayusphere.png",
                      linkUrl: "https://your-link.com",
                    ),
                    const SizedBox(height: 20),

                    ShortCard1(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                      title: "AARAV",
                      description: "Mental health and wellness app",
                      imagePath: "assets/card_icons/logo_a.png",
                      linkUrl: "https://your-link.com",
                    ),
                    const SizedBox(height: 20),
                    ShortCard2(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                      title: "Chatellar",
                      description: "A chat application with a twist",
                      imagePath: "assets/card_icons/cover3.png",
                      linkUrl: "https://your-link.com",
                    ),
                  ],
                )
                : Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LongCard1(
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.5,
                          title: "ByG⧋ZE",
                          description: "AI powered learning management system",
                          imagePath: "assets/card_icons/bygaze.png",
                          linkUrl: "https://your-link.com",
                        ),
                        const SizedBox(width: 20),
                        ShortCard1(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.5,
                          title: "AARAV",
                          description: "Mental health and wellness app",
                          imagePath: "assets/card_icons/logo_a.png",
                          linkUrl: "https://your-link.com",
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        ShortCard2(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.5,
                          title: "Chatellar",
                          description: "A chat application with a twist",
                          imagePath: "assets/card_icons/cover3.png",
                          linkUrl: "https://your-link.com",
                        ),
                        const SizedBox(width: 20),
                        LongCard2(
                          width: screenWidth * 0.45,
                          height: screenHeight * 0.5,
                          title: "VaayuSphere",
                          description:
                              "A web-based air quality monitoring and complaning system",
                          imagePath: "assets/card_icons/vaayusphere.png",
                          linkUrl: "https://your-link.com",
                        ),
                      ],
                    ),
                  ],
                ),

            SizedBox(height: screenHeight * 0.15),

            // Centered Dock
            Center(
              child: SizedBox(
                width: screenWidth * 0.8,
                child:
                    !isMobile
                        ? ToolsAndTechnologies()
                        : MobileToolsAndTechnologies(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
