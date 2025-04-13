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
  double radiusFactor = 3.5;
  double iconSpacing = 4.0;
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

  // Ensure no more than 10 items per row
  List<List<String>> _getRows(int itemsPerRow) {
    List<List<String>> rows = [];
    for (int i = 0; i < dockItems.length; i += itemsPerRow) {
      rows.add(
        dockItems.sublist(
          i,
          i + itemsPerRow > dockItems.length
              ? dockItems.length
              : i + itemsPerRow,
        ),
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
        LayoutBuilder(
          builder: (context, constraints) {
            // Define the number of items per row (fixed to 10)
            int itemsPerRow = 10;

            // Calculate the icon size based on 10 items per row
            double availableWidth = constraints.maxWidth;
            double iconSize = availableWidth / itemsPerRow; // 10 items per row
            iconSize = iconSize > 80 ? 80 : iconSize; // Cap the icon size to 80

            // Get rows with the appropriate number of items based on the icon size
            List<List<String>> rows = _getRows(itemsPerRow);

            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 30,
                  children:
                      rows.map((row) {
                        return SizedBox(
                          width:
                              constraints
                                  .maxWidth, // Set a fixed width for the dock
                          height: iconSize + 20,
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
                                        .map((item) => Image.asset(item))
                                        .toList(),
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
