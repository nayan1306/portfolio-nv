import 'package:flutter/material.dart';
import 'package:macos_dock/macos_dock.dart';

class ToolsAndTechnologies extends StatefulWidget {
  const ToolsAndTechnologies({super.key});

  @override
  State<ToolsAndTechnologies> createState() => _ToolsAndTechnologiesState();
}

class _ToolsAndTechnologiesState extends State<ToolsAndTechnologies> {
  double scaleFactor = 1.2;
  double translateFactor = 1.5;
  double radiusFactor = 5.5;
  double iconSpacing = 6.0;
  bool enableReordering = false;
  Duration animationDuration = const Duration(milliseconds: 200);

  List<String> dockItems = [
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
    'assets/cube.png',
  ];

  void _handleReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = dockItems.removeAt(oldIndex);
      dockItems.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Responsive Dock with horizontal scrolling to avoid overflow
        SizedBox(
          height: 100,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate the maximum icon size based on available width
              double availableWidth = constraints.maxWidth;
              double maxIconSize = availableWidth / dockItems.length;

              // Update the scaleFactor dynamically based on available space
              double iconSize =
                  maxIconSize > 60
                      ? 60
                      : maxIconSize; // Cap the icon size to a maximum value

              return Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                            dockItems.map((item) => Image.asset(item)).toList(),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
