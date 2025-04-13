import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/git_hub_button.dart';
import 'package:portfolio_website/widgets/glass_tile.dart';
import 'package:portfolio_website/widgets/hover_button.dart';
import 'package:portfolio_website/widgets/intro_text.dart';
import 'package:portfolio_website/widgets/stars_bg.dart';
import 'package:portfolio_website/widgets/tagline.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({super.key});

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
                  Colors.black.withOpacity(0.8),
                  const Color.fromARGB(255, 31, 31, 31).withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Reactive Stars background
          const ReactiveStars(
            starCount: 250,
            maxStarSize: 2.5,
            parallaxStrength: 50,
          ),

          // Main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.11,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    TagLine(),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        "",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GitHubButton(),
                    HoverButton(buttonText: "Sponser", onPressed: () {}),
                    const SizedBox(width: 20),
                    HoverButton(buttonText: "CONTACT", onPressed: () {}),
                  ],
                ),
              ),

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
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              "Nayan Verma",
                              style: Theme.of(
                                context,
                              ).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 90,
                              ),
                            ),
                            const SizedBox(height: 20),
                            buildAnimatedIntroText(screenWidth),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Glass Tile
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.11,
                  top: screenHeight * 0.1,
                ),
                child: GlassTile(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.flutter_dash, size: 40, color: Colors.white),
                      SizedBox(height: 8),
                      Text(
                        "Flutter Power",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
