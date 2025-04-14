import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/s5/widgets/email_copy_box.dart';
import 'package:portfolio_website/screens/s5/widgets/social_button.dart';

class SectionFive extends StatelessWidget {
  const SectionFive({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      key: key,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.11,
        vertical: isMobile ? 40 : screenHeight * 0.1,
      ),
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
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.center,
        children: [
          Text(
            "Connect With Me",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 24 : screenWidth * 0.04,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Let’s build something truly incredible together — a fusion of creativity, innovation, and passion that leaves a lasting impact.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 14 : screenWidth * 0.01,
              color: const Color.fromARGB(174, 255, 255, 255),
              fontWeight: FontWeight.w200,
            ),
          ),
          const SizedBox(height: 32),

          // Social Icons
          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? 12 : 24,
            runSpacing: 16,
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

          const SizedBox(height: 32),
          EmailCopyBox(email: 'vnayan94@gmail.com'),

          const SizedBox(height: 40),

          // Footer
          isMobile
              ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Copyright © 2025 Nayan Verma. All rights reserved.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: const Color.fromARGB(119, 255, 255, 255),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://media.giphy.com/media/kmUvauX8TMWg0OsqKW/giphy.gif",
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Crafted with precision",
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 100, 100, 100),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Copyright © 2025 Nayan Verma. All rights reserved.",
                    style: TextStyle(
                      fontSize: screenWidth * 0.01,
                      color: const Color.fromARGB(119, 255, 255, 255),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/earth.gif",
                        width: screenWidth * 0.04,
                        height: screenHeight * 0.04,
                      ),
                      const SizedBox(width: 8),
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
    );
  }
}
