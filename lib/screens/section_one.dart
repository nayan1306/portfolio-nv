import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/widgets/git_hub_button.dart';
import 'package:portfolio_website/widgets/hover_button.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final responsiveHeight = screenHeight * 1.3;

    return Container(
      height: responsiveHeight,
      decoration: const BoxDecoration(color: Color.fromARGB(0, 0, 0, 0)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Responsive Custom AppBar
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.11,
              vertical: 12,
            ),
            child: Row(
              children: [
                Image.asset("assets/logo_nv.png", width: 30, height: 30),
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
                SizedBox(width: 20),
                HoverButton(buttonText: "CONTACT", onPressed: () {}),
              ],
            ),
          ),

          // Section Body
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.11,
                    top: screenHeight * 0.1,
                  ),
                  child: SizedBox(
                    width: screenWidth * 0.35,
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 40,
                    //   vertical: 20,
                    // ),
                    // color: Colors.amber,
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
                        SizedBox(
                          width: screenWidth * 0.28,
                          child: Text(
                            "Crafting pixel-perfect Flutter apps with precision and creativity. I'm driven by innovation, constantly exploring new technologies to build seamless and intuitive experiences.",
                            style: GoogleFonts.orbitron(
                              color: const Color.fromARGB(197, 255, 255, 255),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 1.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
