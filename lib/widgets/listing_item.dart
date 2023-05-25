import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/constants.dart';
import 'package:flutter_airbnb_ui/listing.dart';
import 'package:flutter_airbnb_ui/pages/listing_page.dart';
import 'package:flutter_airbnb_ui/widgets/book_flip.dart';
import 'package:flutter_airbnb_ui/widgets/listing_info.dart';

class ListingItem extends StatefulWidget {
  const ListingItem({
    super.key,
    required this.listing,
  });

  final Listing listing;

  @override
  State<ListingItem> createState() => _ListingItemState();
}

class _ListingItemState extends State<ListingItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _curvedAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            child: GestureDetector(
              onTapDown: (_) {
                _animationController.animateTo(0.33);
              },
              onTapUp: (_) {
                _animationController.animateTo(0).then((value) {
                  _openListingPage(context);
                });
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.listing.coverUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 25,
                    right: 0,
                    child: Hero(
                      tag: 'listing_hero_${widget.listing.id}',
                      flightShuttleBuilder: (
                        BuildContext flightContext,
                        Animation<double> animation,
                        HeroFlightDirection flightDirection,
                        BuildContext fromHeroContext,
                        BuildContext toHeroContext,
                      ) {
                        final curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        );
                        final scaleAnimation = Tween<double>(
                          begin: Constants.bookInitialScale,
                          end: 1,
                        ).animate(curvedAnimation);

                        return ScaleTransition(
                          scale: scaleAnimation,
                          alignment: Alignment.bottomLeft,
                          child: BookFlip(
                            widget.listing,
                            animationController: curvedAnimation,
                          ),
                        );
                      },
                      child: Transform.scale(
                        scale: Constants.bookInitialScale,
                        alignment: Alignment.bottomLeft,
                        child: BookFlip(
                          widget.listing,
                          animationController: _curvedAnimation,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListingInfo(widget.listing),
        ],
      ),
    );
  }

  void _openListingPage(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Constants.animationDuration,
        reverseTransitionDuration: Constants.animationDuration,
        pageBuilder: (BuildContext context, Animation<double> animation, _) {
          return ListingPage(widget.listing);
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            _, Widget child) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          );

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
      ),
    );
  }
}
