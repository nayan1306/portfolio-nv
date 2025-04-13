import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class ReactiveStars extends StatefulWidget {
  final int starCount;
  final double maxStarSize;
  final double parallaxStrength;

  const ReactiveStars({
    super.key,
    this.starCount = 100,
    this.maxStarSize = 2.5,
    this.parallaxStrength = 40,
  });

  @override
  State<ReactiveStars> createState() => _ReactiveStarsState();
}

class _ReactiveStarsState extends State<ReactiveStars>
    with SingleTickerProviderStateMixin {
  Offset mouseOffset = Offset.zero;
  final Random random = Random();
  late List<Offset> starPositions;
  late List<double> starSizes;
  late List<double> starPhases;
  late List<Offset> starVelocities;

  late AnimationController _controller;
  Duration? _lastUpdate;
  double _cumulativeTime = 0.0;

  @override
  void initState() {
    super.initState();
    generateStars();
    _controller =
        AnimationController(vsync: this, duration: const Duration(days: 1))
          ..addListener(_onTick)
          ..forward();
    _lastUpdate = _controller.lastElapsedDuration;
  }

  void generateStars() {
    starPositions = List.generate(
      widget.starCount,
      (_) => Offset(random.nextDouble(), random.nextDouble()),
    );
    starSizes = List.generate(
      widget.starCount,
      (_) => random.nextDouble() * widget.maxStarSize + 0.5,
    );
    starPhases = List.generate(
      widget.starCount,
      (_) => random.nextDouble() * 2 * pi,
    );
    starVelocities = List.generate(
      widget.starCount,
      (_) => Offset(
        (random.nextDouble() - 0.5) * 0.02,
        (random.nextDouble() - 0.5) * 0.02,
      ),
    );
  }

  void _onTick() {
    final current = _controller.lastElapsedDuration;
    if (current != null && _lastUpdate != null) {
      final dt = (current - _lastUpdate!).inMilliseconds / 1000.0;
      _cumulativeTime += dt;

      for (int i = 0; i < starPositions.length; i++) {
        double newX = starPositions[i].dx + starVelocities[i].dx * dt;
        double newY = starPositions[i].dy + starVelocities[i].dy * dt;
        if (newX < 0)
          newX += 1;
        else if (newX > 1)
          newX -= 1;
        if (newY < 0)
          newY += 1;
        else if (newY > 1)
          newY -= 1;
        starPositions[i] = Offset(newX, newY);
      }

      _lastUpdate = current;
      setState(() {});
    }
  }

  void _updateMouseOffset(PointerHoverEvent event) {
    final size = MediaQuery.of(context).size;
    final newOffset = (event.position - size.center(Offset.zero)) / size.width;

    // Avoid triggering too many setStates for tiny mouse movements
    if ((newOffset - mouseOffset).distance > 0.001) {
      setState(() => mouseOffset = newOffset);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _updateMouseOffset,
      child: CustomPaint(
        size: Size.infinite,
        painter: StarPainter(
          stars: starPositions,
          sizes: starSizes,
          phases: starPhases,
          time: _cumulativeTime,
          offset: mouseOffset,
          parallaxStrength: widget.parallaxStrength,
        ),
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final List<Offset> stars;
  final List<double> sizes;
  final List<double> phases;
  final double time;
  final Offset offset;
  final double parallaxStrength;

  StarPainter({
    required this.stars,
    required this.sizes,
    required this.phases,
    required this.time,
    required this.offset,
    required this.parallaxStrength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final mousePos = center + offset * size.width;

    for (int i = 0; i < stars.length; i++) {
      final normalized = stars[i];
      final baseSize = sizes[i];

      // Calculate star screen position with parallax.
      final pos = Offset(
        normalized.dx * size.width + offset.dx * parallaxStrength,
        normalized.dy * size.height + offset.dy * parallaxStrength,
      );

      // Skip if outside screen bounds (small optimization).
      if (pos.dx < 0 ||
          pos.dx > size.width ||
          pos.dy < 0 ||
          pos.dy > size.height)
        continue;

      // Distance to mouse determines brightness and size multiplier.
      final distToMouse = (pos - mousePos).distance;
      final proximityFactor = (1.0 - (distToMouse / 250).clamp(0, 1)); // 0 to 1

      // Twinkle shimmer
      final shimmer = 0.5 + 0.5 * sin(time * 2 * pi + phases[i]);

      // Final size and color
      final dynamicSize =
          baseSize * (0.8 + 0.2 * shimmer) * (0.6 + 0.4 * proximityFactor);
      final color = Colors.white.withOpacity(
        (0.4 + 0.5 * shimmer) * (0.5 + 0.5 * proximityFactor),
      );

      final paint = Paint()..color = color;

      // Glow
      final glowRect = Rect.fromCircle(center: pos, radius: dynamicSize * 2.5);
      final gradient = RadialGradient(colors: [color, Colors.transparent]);
      final glowPaint =
          Paint()
            ..shader = gradient.createShader(glowRect)
            ..blendMode = BlendMode.plus;

      canvas.drawCircle(pos, dynamicSize * 2.5, glowPaint);
      canvas.drawCircle(pos, dynamicSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant StarPainter oldDelegate) =>
      oldDelegate.offset != offset || oldDelegate.time != time;
}
