import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ShortCard1 extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String description;
  final String imagePath; // can be a network or asset image
  final String linkUrl;
  final String subtitle;

  const ShortCard1({
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
    return Center(
      child: Tilt(
        borderRadius: BorderRadius.circular(24),
        tiltConfig: TiltConfig(
          angle: 15.0,
          enableGestureSensors:
              !kIsWeb && (Platform.isAndroid || Platform.isIOS),
          enableReverse: true,
          filterQuality: FilterQuality.medium,
          enableGestureHover: true,
          enableGestureTouch: true,
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
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top: Image with parallax, Title & Description
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TiltParallax(
                    size: const Offset(20, 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) =>
                                const Icon(Icons.image, color: Colors.white38),
                      ),
                    ),
                  ),
                  const SizedBox(width: 26),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Description \nThis is a sample motivation text that describes the project, this is a sample motivation text that describes the project., this is a sample motivation text that describes the project., this is a sample motivation text that describes the project.",
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Bottom: "Explore More" as clickable text
              Center(
                child: TiltParallax(
                  child: GestureDetector(
                    onTap: _launchURL,
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 146, 146, 146),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
