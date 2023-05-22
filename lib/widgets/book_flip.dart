import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/models/listing.dart';
import 'package:flutter_airbnb_ui/widgets/avatar.dart';
import 'package:flutter_airbnb_ui/widgets/landlord_info.dart';

class BookFlip extends StatelessWidget {
  const BookFlip({
    super.key,
    required this.listing,
  });

  final Listing listing;
  static const double radius = 20;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 220),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20, right: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Avatar(
                        imageUrl: listing.landlordAvatarUrl,
                        hasBadge: true,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        listing.landlordName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.person, size: 16),
                          SizedBox(width: 2),
                          Text(
                            'Superhost',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 40),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
                color: Colors.white,
              ),
              child: LandlordInfo(listing),
            ),
          ),
        ],
      ),
    );
  }
}
