class Listing {
  const Listing({
    required this.coverUrl,
    required this.landlordAvatarUrl,
    required this.title,
    required this.address,
    required this.availability,
    this.rating = 0,
    this.reviewsCount = 0,
    required this.price,
  });

  final String coverUrl;
  final String landlordAvatarUrl;
  final String title;
  final String address;
  final String availability;
  final double rating;
  final double price;
  final int reviewsCount;
}
