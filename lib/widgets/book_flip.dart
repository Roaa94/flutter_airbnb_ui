import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/constants.dart';
import 'package:flutter_airbnb_ui/listing.dart';
import 'package:flutter_airbnb_ui/widgets/book_back.dart';
import 'package:flutter_airbnb_ui/widgets/book_cover_back.dart';
import 'package:flutter_airbnb_ui/widgets/book_cover_front.dart';

class BookFlip extends StatefulWidget {
  const BookFlip(
    this.listing, {
    super.key,
    this.initialFlipProgress = 0,
    this.animationController,
  });

  final Listing listing;
  final double initialFlipProgress;
  final Animation<double>? animationController;

  @override
  State<BookFlip> createState() => _BookFlipState();
}

class _BookFlipState extends State<BookFlip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Constants.animationDuration,
      value: widget.initialFlipProgress,
    );

    _animation = widget.animationController ??
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        );

    _flipAnimation = Tween<double>(begin: 1, end: 0).animate(_animation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return FractionalTranslation(
            translation: Offset(-0.5 * _flipAnimation.value, 0),
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
                        ..setEntry(3, 2, Constants.perspectiveValue)
                        ..rotateY(-pi * _flipAnimation.value),
                      alignment: Alignment.centerRight,
                      child: Stack(
                        children: [
                          _flipAnimation.value <= 0.5
                              ? Positioned.fill(
                                  child: BookCoverBack(widget.listing),
                                )
                              : Positioned.fill(
                                  child: Transform(
                                    transform: Matrix4.identity()
                                      ..setEntry(
                                          3, 2, Constants.perspectiveValue)
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
    );
  }
}
