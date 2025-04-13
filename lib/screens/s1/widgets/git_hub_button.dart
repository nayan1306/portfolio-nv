import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GitHubButton extends StatelessWidget {
  const GitHubButton({super.key});

  void _launchGitHub() async {
    final uri = Uri.parse('https://github.com/nayan1306');
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      ); // for web compatibility
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      onPressed: _launchGitHub,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/socials/github.png", width: 20),
          const SizedBox(width: 5),
          const Text("Star Me", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
