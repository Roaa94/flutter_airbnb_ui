import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/constants.dart';
import 'package:flutter_airbnb_ui/models/listing.dart';
import 'package:flutter_airbnb_ui/widgets/avatar.dart';

class BookCoverFront extends StatelessWidget {
  const BookCoverFront(
    this.listing, {
    super.key,
  });

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 20,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(Constants.bookBorderRadius),
          bottomRight: Radius.circular(Constants.bookBorderRadius),
        ),
        color: Colors.grey.shade200,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(8, 0),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Avatar(
        imageUrl: listing.landlordAvatarUrl,
        size: 140,
      ),
    );
  }
}
