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
  double _sliderValue = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FractionalTranslation(
          translation: Offset(-0.5 * _sliderValue, 0),
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
                      ..rotateY(-pi * _sliderValue),
                    alignment: Alignment.centerRight,
                    child: Stack(
                      children: [
                        _sliderValue <= 0.5
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
        ),
        Slider(
          min: 0,
          max: 1,
          value: _sliderValue,
          onChanged: (value) => setState(() => _sliderValue = value),
        )
      ],
    );
  }
}
