import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HoverButton extends StatefulWidget {
  final String buttonText; // Accept the text as a parameter
  final VoidCallback onPressed; // Callback for tap

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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(
          widget.buttonText,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            // fontSize: 18,
          ),
        ),
      ),
    );
  }
}
