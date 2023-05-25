import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/listing.dart';

class ListingInfo extends StatelessWidget {
  const ListingInfo(
    this.listing, {
    super.key,
  });

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        ),
      ],
    );
  }
}
