import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LongCard1 extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String description;
  final String imagePath;
  final String linkUrl;
  final String subtitle;

  const LongCard1({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.linkUrl,
    this.subtitle = "Explore more",
  });

  void _launchURL() async {
    final Uri uri = Uri.parse(linkUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $linkUrl");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth < 1000 && !isMobile;

    final titleFontSize =
        isMobile
            ? 22.0
            : isTablet
            ? 32.0
            : 40.0;
    final descriptionFontSize =
        isMobile
            ? 14.0
            : isTablet
            ? 16.0
            : 18.0;
    final bodyFontSize =
        isMobile
            ? 13.0
            : isTablet
            ? 15.0
            : 18.0;
    final imageSize = isMobile ? 50.0 : 80.0;
    final cardPadding = isMobile ? 16.0 : 24.0;

    return Center(
      child: Tilt(
        borderRadius: BorderRadius.circular(24),
        tiltConfig: TiltConfig(
          angle: 15.0,
          enableReverse: true,
          filterQuality: FilterQuality.medium,
          enableGestureHover: true,
          enableGestureTouch: true,
          enableGestureSensors: true,
          enableRevert: true,
          moveDuration: const Duration(milliseconds: 120),
          leaveDuration: const Duration(milliseconds: 350),
          moveCurve: Curves.easeOutCubic,
          leaveCurve: Curves.easeOut,
          sensorFactor: 8.0,
          enableSensorRevert: true,
          sensorRevertFactor: 0.08,
        ),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(cardPadding),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/stars_final.gif"),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Section: Image + Title + Description
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TiltParallax(
                            size: const Offset(20, 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                imagePath,
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (_, __, ___) => const Icon(
                                      Icons.image,
                                      color: Colors.white38,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TiltParallax(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8),
                                  Text(
                                    title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: titleFontSize,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    description,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: descriptionFontSize,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Motivation / Explanation Text
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "ByGaze is an AI-powered ed-tech platform that enhances the learning consistency and fosters creativity, leveraging advanced AI tools to personalize and optimize the student experience. Its innovative approach transforms the learning journey, making it more engaging, adaptive, and effective for every student.",
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: bodyFontSize,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "The purpose of education is to awaken the youth to their potential, empowering them to think deeply, act with purpose, and shape a better future through knowledge and integrity.",
                          style: GoogleFonts.marhey(
                            color: Colors.white70,
                            fontSize: bodyFontSize,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Explore More Button
              Center(
                child: TiltParallax(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: _launchURL,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isMobile ? 14 : 16,
                          fontWeight:
                              Theme.of(context).brightness == Brightness.light
                                  ? FontWeight.w500
                                  : FontWeight.bold,
                        ),
                        child: Text(subtitle),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
