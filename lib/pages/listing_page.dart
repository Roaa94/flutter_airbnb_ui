import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/listing.dart';
import 'package:flutter_airbnb_ui/widgets/book_flip.dart';

class ListingPage extends StatelessWidget {
  const ListingPage(
    this.listing, {
    super.key,
  });

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scroll) {
          if (scroll is OverscrollNotification &&
              scroll.dragDetails != null &&
              scroll.dragDetails!.delta.dy > 10) {
            Navigator.of(context).pop();
            return false;
          }
          return true;
        },
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 200),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 50,
                        height: 4,
                        margin: const EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Hero(
                        tag: 'listing_hero_${listing.id}',
                        child: BookFlip(
                          listing,
                          initialFlipProgress: 1,
                        ),
                      ),
                    ),
                    ...List.generate(
                      listing.infoItems.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              listing.infoItems[index].icon,
                              size: 30,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                listing.infoItems[index].text,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        listing.landlordDescription,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
