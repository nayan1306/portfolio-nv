import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BygazeButton extends StatefulWidget {
  final String buttonText; // Accept the text as a parameter

  const BygazeButton({super.key, required this.buttonText});

  @override
  State<BygazeButton> createState() => _BygazeButtonState();
}

class _BygazeButtonState extends State<BygazeButton> {
  bool _isHovered = false;

  Future<void> _launchResumeLink() async {
    const url =
        'https://drive.google.com/file/d/1MosoCVvnFzFP2L1Ilhm7D4EbPdiFcFmi/view?usp=sharing';
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ElevatedButton(
        onPressed: _launchResumeLink,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _isHovered
                  ? const Color.fromARGB(0, 255, 255, 255)
                  : const Color.fromARGB(0, 0, 0, 0),
          elevation: _isHovered ? 3 : 2,
          shadowColor:
              _isHovered
                  ? const Color.fromARGB(0, 255, 243, 133)
                  : const Color.fromARGB(255, 21, 21, 21),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color:
                  _isHovered
                      ? const Color.fromARGB(255, 184, 117, 255)
                      : const Color.fromARGB(174, 99, 99, 99),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(
          widget.buttonText,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ByGazeDemo extends StatefulWidget {
  final String buttonText; // Accept the text as a parameter

  const ByGazeDemo({super.key, required this.buttonText});

  @override
  State<ByGazeDemo> createState() => _ByGazeDemoState();
}

class _ByGazeDemoState extends State<ByGazeDemo> {
  bool _isHovered = false;

  Future<void> _launchResumeLink() async {
    const url =
        'https://drive.google.com/file/d/1MosoCVvnFzFP2L1Ilhm7D4EbPdiFcFmi/view?usp=sharing';
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ElevatedButton(
        onPressed: _launchResumeLink,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _isHovered
                  ? const Color.fromARGB(0, 255, 255, 255)
                  : const Color.fromARGB(0, 0, 0, 0),
          elevation: _isHovered ? 3 : 2,
          shadowColor:
              _isHovered
                  ? const Color.fromARGB(0, 255, 243, 133)
                  : const Color.fromARGB(255, 21, 21, 21),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color:
                  _isHovered
                      ? const Color.fromARGB(255, 121, 255, 87)
                      : const Color.fromARGB(174, 99, 99, 99),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(
          widget.buttonText,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
