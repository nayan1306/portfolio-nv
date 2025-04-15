import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GitHubButton extends StatelessWidget {
  const GitHubButton({super.key});

  void _launchGitHub() async {
    final uri = Uri.parse('https://github.com/nayan1306');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive logic
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1100;

    final double iconSize = isMobile ? 18 : (isTablet ? 20 : 24);
    final double fontSize = isMobile ? 12 : (isTablet ? 16 : 18);
    final EdgeInsets padding =
        isMobile
            ? const EdgeInsets.symmetric(horizontal: 6, vertical: 5)
            : (isTablet
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
                : const EdgeInsets.symmetric(horizontal: 24, vertical: 14));

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        elevation: 0,
        padding: padding,
      ),
      onPressed: _launchGitHub,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/socials/github.png", width: iconSize),
          const SizedBox(width: 5),
          Text(
            "Star Me",
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
