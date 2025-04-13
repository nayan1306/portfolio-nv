import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailCopyBox extends StatefulWidget {
  final String email;

  const EmailCopyBox({super.key, required this.email});

  @override
  State<EmailCopyBox> createState() => _EmailCopyBoxState();
}

class _EmailCopyBoxState extends State<EmailCopyBox> {
  bool _copied = false;

  void _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.email));
    setState(() => _copied = true);

    // Revert back to default icon after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.email,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _copyToClipboard,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder:
                  (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
              child:
                  _copied
                      ? const Icon(
                        Icons.check,
                        key: ValueKey('copied'),
                        size: 20,
                        color: Colors.greenAccent,
                      )
                      : const Icon(
                        Icons.copy,
                        key: ValueKey('copy'),
                        size: 20,
                        color: Colors.white54,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
