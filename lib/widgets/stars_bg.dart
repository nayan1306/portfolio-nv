import 'package:flutter/material.dart';
import 'dart:math';

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

class _ReactiveStarsState extends State<ReactiveStars> {
  Offset mouseOffset = Offset.zero;
  final Random random = Random();
  late List<Offset> starPositions;
  late List<double> starSizes;

  @override
  void initState() {
    super.initState();
    generateStars();
  }

  void generateStars() {
    starPositions = List.generate(widget.starCount, (_) {
      return Offset(random.nextDouble(), random.nextDouble());
    });

    starSizes = List.generate(widget.starCount, (_) {
      return random.nextDouble() * widget.maxStarSize + 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          final size = MediaQuery.of(context).size;
          mouseOffset =
              (event.position - size.center(Offset.zero)) / size.width;
        });
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: StarPainter(
          stars: starPositions,
          sizes: starSizes,
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
  final Offset offset;
  final double parallaxStrength;

  StarPainter({
    required this.stars,
    required this.sizes,
    required this.offset,
    required this.parallaxStrength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.8);
    for (int i = 0; i < stars.length; i++) {
      final star = stars[i];
      final starOffset = Offset(
        star.dx * size.width + offset.dx * parallaxStrength,
        star.dy * size.height + offset.dy * parallaxStrength,
      );
      canvas.drawCircle(starOffset, sizes[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant StarPainter oldDelegate) =>
      oldDelegate.offset != offset;
}
