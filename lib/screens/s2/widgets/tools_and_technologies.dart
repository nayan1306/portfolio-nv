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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Tools & Technologies Heading
        Text(
          "Tools & Technologies",
          style: GoogleFonts.robotoCondensed(
            textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 70,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Tools and technologies I have worked with and am proficient in.",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 40),
        LayoutBuilder(
          builder: (context, constraints) {
            const int itemsPerRow = 10;
            double iconSize = (constraints.maxWidth / itemsPerRow).clamp(0, 80);

            List<List<String>> rows = _getRows(itemsPerRow);

            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children:
                      rows.map((row) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
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
                                        row
                                            .map(
                                              (item) => Container(
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                    208,
                                                    255,
                                                    255,
                                                    255,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          const Color.fromARGB(
                                                            255,
                                                            0,
                                                            0,
                                                            0,
                                                          ).withOpacity(0.3),
                                                      blurRadius: 10,
                                                      offset: const Offset(
                                                        0,
                                                        2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                padding: const EdgeInsets.all(
                                                  8,
                                                ),
                                                child: Image.asset(item),
                                              ),
                                            )
                                            .toList(),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
