import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/s5/widgets/email_copy_box.dart';
import 'package:portfolio_website/screens/s5/widgets/social_button.dart';

class SectionFive extends StatelessWidget {
  const SectionFive({super.key}); // Accepts a Key

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      key: key, // Use the passed key here
      width: double.infinity,
      height: screenHeight * 0.7,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 0, 0, 0),
            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Connect With Me",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Let’s build something truly incredible together — a fusion of creativity, innovation, and passion that leaves a lasting impact.",
              style: TextStyle(
                fontSize: screenWidth * 0.01,
                color: const Color.fromARGB(174, 255, 255, 255),
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  url: 'https://github.com/nayan1306',
                  imagePath: 'assets/socials/s (1).png',
                ),
                SocialButton(
                  url:
                      'https://mail.google.com/mail/?view=cm&fs=1&to=vnayan94@gmail.com',
                  imagePath: 'assets/socials/s (2).png',
                ),
                SocialButton(
                  url: 'https://www.linkedin.com/in/nayanverma/',
                  imagePath: 'assets/socials/s (3).png',
                ),
                SocialButton(
                  url: 'https://x.com/Nayan__V',
                  imagePath: 'assets/socials/s (4).png',
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            EmailCopyBox(email: 'vnayan94@gmail.com'),

            SizedBox(height: screenHeight * 0.198),
            Row(
              children: [
                Text(
                  "Copyright © 2025 Nayan Verma. All rights reserved.",
                  style: TextStyle(
                    fontSize: screenWidth * 0.01,
                    color: const Color.fromARGB(119, 255, 255, 255),
                    fontWeight: FontWeight.w100,
                  ),
                ),
                SizedBox(width: screenWidth * 0.4),
                Row(
                  children: [
                    Image.network(
                      "https://media.giphy.com/media/kmUvauX8TMWg0OsqKW/giphy.gif?cid=ecf05e47qoyv3tn1wsxkzr0diaxz5js3l2xdea53i46a22wd&ep=v1_stickers_search&rid=giphy.gif&ct=e",
                      width: screenWidth * 0.04,
                      height: screenHeight * 0.04,
                    ),
                    Text(
                      "Crafted with precision",
                      style: TextStyle(
                        fontSize: screenWidth * 0.01,
                        color: const Color.fromARGB(255, 100, 100, 100),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
