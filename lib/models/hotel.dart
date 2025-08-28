class Hotel {
  final String id;
  final String name;
  final String location;
  final double rating;
  final int price;
  final String priceDisplay;
  final String mainImage;
  final List<String> images;
  final List<String> amenities;
  final String description;
  final String? discount;
  final bool isPopular;

  Hotel({
    required this.id,
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.priceDisplay,
    required this.mainImage,
    required this.images,
    required this.amenities,
    required this.description,
    this.discount,
    this.isPopular = false,
  });
}