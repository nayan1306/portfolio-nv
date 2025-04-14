import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GlassCard extends StatefulWidget {
  final double width;
  final double height;
  final Widget? child;

  const GlassCard({super.key, this.width = 200, this.height = 120, this.child});

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset("assets/banner/banner_final.mp4")
          ..setLooping(true)
          ..setVolume(0)
          ..initialize().then((_) {
            setState(() {}); // Refresh to show video when initialized
            _controller.play(); // Autoplay
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Video background
            if (_controller.value.isInitialized)
              FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),

            /// Glass effect overlay
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(
                        255,
                        192,
                        192,
                        192,
                      ).withOpacity(0.08),
                      Colors.black12,
                      Colors.white.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            /// Optional child (e.g., text or widgets)
            if (widget.child != null) Center(child: widget.child),
          ],
        ),
      ),
    );
  }
}
