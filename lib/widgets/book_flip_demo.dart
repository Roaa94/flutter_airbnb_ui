import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/items.dart';
import 'package:flutter_airbnb_ui/widgets/book_flip.dart';

class BookFlipDemo extends StatefulWidget {
  const BookFlipDemo({super.key});

  @override
  State<BookFlipDemo> createState() => _BookFlipDemoState();
}

class _BookFlipDemoState extends State<BookFlipDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool _isOpen = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookFlip(
              listings[0],
              animationController: CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Closed'),
                const SizedBox(width: 5),
                Switch.adaptive(
                  value: _isOpen,
                  onChanged: (_) {
                    if (_animationController.isCompleted) {
                      _animationController.reverse();
                      setState(() => _isOpen = false);
                    } else {
                      _animationController.forward();
                      setState(() => _isOpen = true);
                    }
                  },
                ),
                const SizedBox(width: 5),
                const Text('Open'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
