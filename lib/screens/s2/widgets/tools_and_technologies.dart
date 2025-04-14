import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macos_dock/macos_dock.dart';

class ToolsAndTechnologies extends StatefulWidget {
  const ToolsAndTechnologies({super.key});

  @override
  State<ToolsAndTechnologies> createState() => _ToolsAndTechnologiesState();
}

class _ToolsAndTechnologiesState extends State<ToolsAndTechnologies> {
  double scaleFactor = 1.2;
  double translateFactor = 1.5;
  double radiusFactor = 3.5;
  double iconSpacing = 4.0;
  bool enableReordering = false;
  Duration animationDuration = const Duration(milliseconds: 200);

  List<String> dockItems = [
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

  void _handleReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = dockItems.removeAt(oldIndex);
      dockItems.insert(newIndex, item);
    });
  }

  List<List<String>> _getRows(int itemsPerRow) {
    List<List<String>> rows = [];
    for (int i = 0; i < dockItems.length; i += itemsPerRow) {
      rows.add(
        dockItems.sublist(i, (i + itemsPerRow).clamp(0, dockItems.length)),
      );
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Determine items per row based on width
    int itemsPerRow;
    if (screenWidth > 1200) {
      itemsPerRow = 10;
    } else if (screenWidth > 800) {
      itemsPerRow = 6;
    } else {
      itemsPerRow = 4;
    }

    double iconSize = (screenWidth / (itemsPerRow * 1.5)).clamp(40, 80);
    double titleFontSize =
        screenWidth > 1000 ? 70 : (screenWidth > 600 ? 48 : 32);
    double subtitleFontSize =
        screenWidth > 1000 ? 20 : (screenWidth > 600 ? 16 : 14);

    List<List<String>> rows = _getRows(itemsPerRow);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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

          // Dock Rows
          ...rows.map((row) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: SizedBox(
                  height: screenHeight * 0.1,
                  child: MacosDock(
                    iconSize: iconSize,
                    scaleFactor: scaleFactor,
                    translateFactor: translateFactor,
                    radiusFactor: radiusFactor,
                    iconSpacing: iconSpacing,
                    enableReordering: enableReordering,
                    onReorder: _handleReorder,
                    animationDuration: animationDuration,
                    children:
                        (scale) =>
                            row.map((item) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    208,
                                    255,
                                    255,
                                    255,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(item),
                              );
                            }).toList(),
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
