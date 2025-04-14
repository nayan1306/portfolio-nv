import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeButton extends StatefulWidget {
  final String buttonText;

  const ResumeButton({super.key, required this.buttonText});

  @override
  State<ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<ResumeButton> {
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
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive size adjustments
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1100;

    final double fontSize = isMobile ? 12 : (isTablet ? 14 : 16);
    final EdgeInsets padding =
        isMobile
            ? const EdgeInsets.symmetric(horizontal: 6, vertical: 5)
            : (isTablet
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 11)
                : const EdgeInsets.symmetric(horizontal: 24, vertical: 12));

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ElevatedButton(
        onPressed: _launchResumeLink,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _isHovered
                  ? const Color.fromARGB(46, 255, 255, 255)
                  : Colors.black,
          elevation: _isHovered ? 3 : 2,
          shadowColor:
              _isHovered
                  ? const Color.fromARGB(255, 255, 243, 133)
                  : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color:
                  _isHovered
                      ? const Color.fromARGB(255, 255, 162, 23)
                      : const Color.fromARGB(174, 99, 99, 99),
              width: 1,
            ),
          ),
          padding: padding,
        ),
        child: Text(
          widget.buttonText,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
