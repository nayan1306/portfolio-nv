import 'package:flutter/material.dart';
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
                    "V",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Image.asset("name")),
                HoverButton(buttonText: "Sponser", onPressed: () {}),
                SizedBox(width: 20),
                HoverButton(buttonText: "CONTACT", onPressed: () {}),
              ],
            ),
          ),

          // Section Body
          Expanded(
            child: Center(
              child: Text(
                "Welcome to Section One",
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
