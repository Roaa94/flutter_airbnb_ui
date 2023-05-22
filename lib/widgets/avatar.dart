import 'dart:math';

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    this.size = 110,
    this.hasBadge = false,
    this.hasInnerShadow = false,
  });

  final String imageUrl;
  final double size;
  final bool hasBadge;
  final bool hasInnerShadow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: hasInnerShadow ? RadialGradient(
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.2),
                ],
                stops: const [0.9, 1],
              ) : null,
            ),
          ),
        ),
        if (hasBadge)
          Positioned(
            bottom: 0,
            right: 0,
            width: 35,
            height: 35,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
              ),
              child: const Icon(
                Icons.verified_user_sharp,
                color: Colors.white,
                size: 18,
              ),
            ),
          )
      ],
    );
  }
}
