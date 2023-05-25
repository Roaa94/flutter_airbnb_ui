import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/items.dart';
import 'package:flutter_airbnb_ui/widgets/book_flip.dart';

class BookFlipDemo extends StatelessWidget {
  const BookFlipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BookFlip(
      listings[0],
    );
  }
}
