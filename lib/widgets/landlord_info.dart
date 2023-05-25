import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/listing.dart';

class LandlordInfo extends StatelessWidget {
  const LandlordInfo(
    this.listing, {
    super.key,
  });

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          listing.reviewsCount.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'Reviews',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 0.8),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              listing.rating.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 2),
            const Icon(Icons.star_rounded, size: 20),
          ],
        ),
        const Text(
          'Rating',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 0.8),
        const SizedBox(height: 8),
        const Text(
          '5',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'Years Hosting',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
