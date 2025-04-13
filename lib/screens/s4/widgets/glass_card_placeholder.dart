import 'package:flutter/material.dart';

class GlassCertificateCard extends StatelessWidget {
  final String? imageUrl;
  final String? label;

  const GlassCertificateCard({super.key, this.imageUrl, this.label});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 1.2),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  imageUrl != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                          imageUrl!,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.redAccent,
                                size: 48,
                              ),
                            );
                          },
                        ),
                      )
                      : const Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.white70,
                          size: 48,
                        ),
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
