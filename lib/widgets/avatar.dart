import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.imageUrl,
    this.size = 110,
    this.hasBadge = false,
  });

  final String imageUrl;
  final double size;
  final bool hasBadge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
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
