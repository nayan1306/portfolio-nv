import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/s1/widgets/git_hub_button.dart';
import 'package:portfolio_website/screens/s1/widgets/glass_card.dart';
import 'package:portfolio_website/screens/s1/widgets/hover_button.dart';
import 'package:portfolio_website/screens/s1/widgets/intro_text.dart';
import 'package:portfolio_website/screens/s1/widgets/resume_button.dart';
import 'package:portfolio_website/screens/s1/widgets/stars_bg.dart';
import 'package:portfolio_website/screens/s1/widgets/tagline.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isTablet = screenSize.width < 1000 && !isMobile;
    final contentPadding = screenSize.width * 0.08;

    // Calculate the height based on device type
    double sectionHeight =
        isMobile
            ? screenSize.height *
                0.7 // More space on mobile
            : isTablet
            ? screenSize.height *
                1.8 // Less space on tablet
            : screenSize.height * 1.7; // Default for desktop

    return SizedBox(
      width: double.infinity,
      height: sectionHeight, // Dynamic height based on device
      child: Stack(
        children: [
          // Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  const Color.fromARGB(255, 31, 31, 31).withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Main Scrollable Content
          SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: contentPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TagLine(),
                      const Spacer(),
                      GitHubButton(),
                      if (!isMobile) const SizedBox(width: 10),
                      ResumeButton(buttonText: "Resume"),
                      if (!isMobile)
                        const SizedBox(width: 10)
                      else
                        const SizedBox(width: 3),
                      if (!isMobile)
                        HoverButton(
                          buttonText: "CONTACT",
                          onPressed: () {
                            scrollController.animateTo(
                              scrollController.position.maxScrollExtent + 700,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                    ],
                  ),
                ),

                // Name and Intro
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nayan Verma",
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              isMobile
                                  ? 38
                                  : isTablet
                                  ? 58
                                  : 90,
                        ),
                      ),
                      const SizedBox(height: 20),
                      buildAnimatedIntroText(screenSize.width),
                      const SizedBox(height: 250), // Leave space for glass card
                    ],
                  ),
                ),

                const SizedBox(height: 400), // Add extra scroll room
              ],
            ),
          ),

          // Fixed GlassCard
          Positioned(
            left: contentPadding,
            right: contentPadding,
            top:
                !isMobile
                    ? screenSize.height * 0.68
                    : screenSize.height *
                        0.40, // Fine-tune this to match your intro
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: GlassCard(
                width: double.infinity,
                // height: null,
              ),
            ),
          ),

          // Stars Background
          const ReactiveStars(
            starCount: 550,
            maxStarSize: 2.5,
            parallaxStrength: 50,
          ),
        ],
      ),
    );
  }
}
