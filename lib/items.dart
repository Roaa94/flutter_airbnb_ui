import 'package:flutter/material.dart';
import 'package:flutter_airbnb_ui/listing.dart';

const infoItems = [
  InfoItem(
    icon: Icons.lightbulb_outline_rounded,
    text: 'Fun fact: I lived in 6 different countries',
  ),
  InfoItem(
    icon: Icons.fastfood_rounded,
    text: 'Favorite breakfast: burgers',
  ),
  InfoItem(
    icon: Icons.pets,
    text: 'Pets: two dogs',
  ),
  InfoItem(
    icon: Icons.language_rounded,
    text: 'Speaks: English, Arabic, French',
  ),
  InfoItem(
    icon: Icons.favorite_border_rounded,
    text: "I'm obsessed with: Travelling & tennis",
  ),
  InfoItem(
    icon: Icons.cake,
    text: 'Born: 1980',
  ),
  InfoItem(
    icon: Icons.book,
    text: 'Bio: Loves to travel',
  ),
  InfoItem(
    icon: Icons.work_outline_rounded,
    text: 'Occupation: Graphic Designer',
  ),
];

const listings = [
  Listing(
      id: 1,
      coverUrl: 'assets/images/listing-1.jpg',
      landlordAvatarUrl: 'assets/images/person-1.jpeg',
      landlordName: 'Jane',
      title: 'Bright apartment in vibrant neighborhood',
      address: 'Berlin, Germany',
      availability: 'May 9 - 14',
      rating: 4.79,
      reviewsCount: 200,
      price: 98,
      infoItems: infoItems,
      landlordDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas odio velit, gravida in tincidunt eget, suscipit et libero. Suspendisse potenti. Curabitur quis quam sodales ante faucibus luctus. Mauris sit amet est eu mauris tristique porttitor.'),
  Listing(
      id: 2,
      coverUrl: 'assets/images/listing-2.jpg',
      landlordAvatarUrl: 'assets/images/person-3.jpeg',
      landlordName: 'Jane',
      title: 'Quiet apartment outside the city',
      address: 'Paris, France',
      availability: 'May 9 - 14',
      rating: 4.5,
      reviewsCount: 400,
      price: 120,
      infoItems: infoItems,
      landlordDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas odio velit, gravida in tincidunt eget, suscipit et libero. Suspendisse potenti. Curabitur quis quam sodales ante faucibus luctus. Mauris sit amet est eu mauris tristique porttitor.'),
  Listing(
      id: 3,
      coverUrl: 'assets/images/listing-3.jpg',
      landlordAvatarUrl: 'assets/images/person-1.jpeg',
      landlordName: 'Jane',
      title: 'Quiet apartment outside the city',
      address: 'Paris, France',
      availability: 'May 9 - 14',
      rating: 4.5,
      reviewsCount: 400,
      price: 120,
      infoItems: infoItems,
      landlordDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas odio velit, gravida in tincidunt eget, suscipit et libero. Suspendisse potenti. Curabitur quis quam sodales ante faucibus luctus. Mauris sit amet est eu mauris tristique porttitor.'),
  Listing(
      id: 4,
      coverUrl: 'assets/images/listing-4.jpg',
      landlordAvatarUrl: 'assets/images/person-2.jpeg',
      landlordName: 'Jane',
      title: 'Quiet apartment outside the city',
      address: 'Paris, France',
      availability: 'May 9 - 14',
      rating: 4.5,
      reviewsCount: 400,
      price: 120,
      infoItems: infoItems,
      landlordDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas odio velit, gravida in tincidunt eget, suscipit et libero. Suspendisse potenti. Curabitur quis quam sodales ante faucibus luctus. Mauris sit amet est eu mauris tristique porttitor.'),
  Listing(
      id: 5,
      coverUrl: 'assets/images/listing-5.jpg',
      landlordAvatarUrl: 'assets/images/person-1.jpeg',
      landlordName: 'Jane',
      title: 'Quiet apartment outside the city',
      address: 'Paris, France',
      availability: 'May 9 - 14',
      rating: 4.5,
      reviewsCount: 400,
      price: 120,
      infoItems: infoItems,
      landlordDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas odio velit, gravida in tincidunt eget, suscipit et libero. Suspendisse potenti. Curabitur quis quam sodales ante faucibus luctus. Mauris sit amet est eu mauris tristique porttitor.'),
  Listing(
      id: 6,
      coverUrl: 'assets/images/listing-6.jpg',
      landlordAvatarUrl: 'assets/images/person-3.jpeg',
      landlordName: 'Jane',
      title: 'Quiet apartment outside the city',
      address: 'Paris, France',
      availability: 'May 9 - 14',
      rating: 4.5,
      reviewsCount: 400,
      price: 120,
      infoItems: infoItems,
      landlordDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas odio velit, gravida in tincidunt eget, suscipit et libero. Suspendisse potenti. Curabitur quis quam sodales ante faucibus luctus. Mauris sit amet est eu mauris tristique porttitor.'),
];
