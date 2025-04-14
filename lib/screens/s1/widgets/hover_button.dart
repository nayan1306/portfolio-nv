import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const HoverButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive logic
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1100;

    final double fontSize = isMobile ? 10 : (isTablet ? 14 : 16);
    final EdgeInsets padding =
        isMobile
            ? EdgeInsets
                .zero // Zero padding for mobile
            : (isTablet
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 11)
                : const EdgeInsets.symmetric(horizontal: 24, vertical: 12));

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _isHovered
                  ? const Color.fromARGB(46, 255, 255, 255)
                  : Colors.black,
          elevation: _isHovered ? 3 : 2,
          shadowColor:
              _isHovered ? const Color.fromARGB(255, 102, 255, 7) : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color:
                  _isHovered
                      ? const Color.fromARGB(255, 126, 255, 114)
                      : const Color.fromARGB(174, 99, 99, 99),
              width: 1,
            ),
          ),
          padding: padding,
        ),
        child:
            isMobile
                ? Icon(Icons.contact_mail, color: Colors.white, size: 16)
                : Text(
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
