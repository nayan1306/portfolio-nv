import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tilt/flutter_tilt.dart';

class MobileToolsAndTechnologies extends StatefulWidget {
  const MobileToolsAndTechnologies({super.key});

  @override
  State<MobileToolsAndTechnologies> createState() =>
      _MobileToolsAndTechnologiesState();
}

class _MobileToolsAndTechnologiesState
    extends State<MobileToolsAndTechnologies> {
  // Fixed number of items per row for mobile
  final int itemsPerRow = 4;

  // List of tools and technologies
  List<String> toolItems = [
    'assets/logos/L (17).png',
    'assets/logos/L (14).png',
    'assets/logos/L (16).png',
    'assets/logos/L (7).png',
    'assets/logos/L (5).png',
    'assets/logos/L (2).png',
    'assets/logos/L (18).png',
    'assets/logos/L (1).png',
    'assets/logos/L (20).png',
    'assets/logos/L (19).png',
    'assets/logos/L (23).png',
    'assets/logos/L (22).png',
    'assets/logos/L (21).png',
    'assets/logos/L (3).png',
    'assets/logos/11.png',
    'assets/logos/12.png',
  ];

  // Split items into rows
  List<List<String>> _getRows() {
    List<List<String>> rows = [];
    for (int i = 0; i < toolItems.length; i += itemsPerRow) {
      rows.add(
        toolItems.sublist(i, (i + itemsPerRow).clamp(0, toolItems.length)),
      );
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // Responsive sizing
    double iconSize = (screenWidth / (itemsPerRow * 1.5)).clamp(40.0, 80.0);
    double titleFontSize = screenWidth > 600 ? 48 : 32;
    double subtitleFontSize = screenWidth > 600 ? 16 : 14;

    // Get rows of items
    List<List<String>> rows = _getRows();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Heading
          Text(
            "Tools & Technologies",
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoCondensed(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: titleFontSize,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Tools and technologies I have worked with and am proficient in.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: subtitleFontSize,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 40),

          // Tilt effect grid
          ...rows.map((row) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    row.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Tilt(
                          borderRadius: BorderRadius.circular(12),
                          tiltConfig: const TiltConfig(
                            angle: 40,
                            enableRevert: true,
                          ),
                          child: Container(
                            width: iconSize,
                            height: iconSize,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(208, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(iconSize * 0.16),
                            child: Image.asset(item, fit: BoxFit.contain),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            );
          }),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
