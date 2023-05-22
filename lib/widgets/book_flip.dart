import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/models/listing.dart';
import 'package:flutter_airbnb_ui/widgets/book_back.dart';
import 'package:flutter_airbnb_ui/widgets/book_cover_back.dart';
import 'package:flutter_airbnb_ui/widgets/book_cover_front.dart';

class BookFlip extends StatefulWidget {
  const BookFlip({
    super.key,
    required this.listing,
  });

  final Listing listing;

  @override
  State<BookFlip> createState() => _BookFlipState();
}

class _BookFlipState extends State<BookFlip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FractionalTranslation(
              translation: Offset(-0.5 * _animation.value, 0),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 220),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: BookBack(widget.listing),
                    ),
                    Expanded(
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(-pi * _animation.value),
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: [
                            _animation.value <= 0.5
                                ? Positioned.fill(
                                    child: BookCoverBack(widget.listing),
                                  )
                                : Positioned.fill(
                                    child: Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.001)
                                        ..rotateY(-pi),
                                      alignment: Alignment.center,
                                      child: BookCoverFront(widget.listing),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          },
          child: const Text('Run'),
        ),
      ],
    );
  }
}
