import 'package:flutter/material.dart';

class Listing {
  const Listing({
    required this.id,
    required this.coverUrl,
    required this.landlordAvatarUrl,
    required this.landlordName,
    required this.landlordDescription,
    required this.title,
    required this.address,
    required this.availability,
    this.rating = 0,
    this.reviewsCount = 0,
    required this.price,
    this.infoItems = const [],
  });

  final int id;
  final String coverUrl;
  final String landlordAvatarUrl;
  final String landlordName;
  final String landlordDescription;
  final String title;
  final String address;
  final String availability;
  final double rating;
  final double price;
  final int reviewsCount;
  final List<InfoItem> infoItems;
}

class InfoItem {
  const InfoItem({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;
}
