import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/listing.dart';
import 'package:flutter_airbnb_ui/pages/listing_page.dart';
import 'package:flutter_airbnb_ui/widgets/book_flip.dart';

class ListingItem extends StatelessWidget {
  const ListingItem({
    super.key,
    required this.listing,
  });

  final Listing listing;

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
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    reverseTransitionDuration:
                        const Duration(milliseconds: 500),
                    pageBuilder:
                        (BuildContext context, Animation<double> animation, _) {
                      return ListingPage(listing);
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation, _, Widget child) {
                      final offsetAnimation = Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: const Offset(0, 0),
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
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
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        listing.coverUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 25,
                    right: 0,
                    child: Hero(
                      tag: 'listing_hero_${listing.id}',
                      child: BookFlip(listing),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listing.address,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star_rounded, size: 18),
                  Text(
                    listing.rating.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          Text(
            listing.title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            listing.availability,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 5),
          RichText(
            text: TextSpan(
              text: '\$${listing.price}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              children: const <TextSpan>[
                TextSpan(
                  text: ' night',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
