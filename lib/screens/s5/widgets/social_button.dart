import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  final String url;
  final String imagePath;
  final double imageWidth;

  const SocialButton({
    super.key,
    required this.url,
    required this.imagePath,
    this.imageWidth = 60,
  });

  void _launchURL() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
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
      onPressed: _launchURL,
      child: Image.asset(imagePath, width: imageWidth),
    );
  }
}
