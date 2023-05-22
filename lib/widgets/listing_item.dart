import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/models/listing.dart';

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
        children: [
          SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                listing.coverUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
