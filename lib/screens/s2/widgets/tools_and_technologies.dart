import 'package:flutter/material.dart';
import 'package:macos_dock/macos_dock.dart';

class ToolsAndTechnologies extends StatefulWidget {
  const ToolsAndTechnologies({super.key});

  @override
  State<ToolsAndTechnologies> createState() => _ToolsAndTechnologiesState();
}

class _ToolsAndTechnologiesState extends State<ToolsAndTechnologies> {
  double scaleFactor = 1.5;
  double translateFactor = 1.5;
  double radiusFactor = 5;
  double iconSpacing = 8.0;
  bool enableReordering = false;
  Duration animationDuration = const Duration(milliseconds: 200);

  List<String> dockItems = [
    'assets/cube.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
    'assets/socials/github.png',
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
        // Dock
        SizedBox(
          height: 100,
          child: MacosDock(
            scaleFactor: scaleFactor,
            translateFactor: translateFactor,
            radiusFactor: radiusFactor,
            iconSpacing: iconSpacing,
            enableReordering: enableReordering,
            onReorder: _handleReorder,
            animationDuration: animationDuration,
            children:
                (scale) => dockItems.map((item) => Image.asset(item)).toList(),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
