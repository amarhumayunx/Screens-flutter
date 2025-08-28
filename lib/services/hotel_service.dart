import '../models/hotel.dart';
import '../models/user_location.dart';

class HotelService {
  // Sample location data
  static UserLocation getCurrentLocation() {
    return UserLocation(
      displayName: "Lahore, Pakistan",
      latitude: 31.5204,
      longitude: 74.3587,
    );
  }

  // Sample hotel data
  static final List<Hotel> _allHotels = [
    // Recommended Hotels
    Hotel(
      id: "1",
      name: "Royal Palace Hotel",
      location: "Mall Road, Lahore",
      rating: 4.8,
      price: 12000,
      priceDisplay: "Rs. 12,000/night",
      mainImage: "https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1564501049412-61c2a3083791?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Pool", "Spa", "Gym", "Restaurant"],
      description: "Experience luxury at its finest with our premium accommodations. Located in the heart of Mall Road, this hotel offers world-class amenities and exceptional service.",
      discount: "20% OFF",
      isPopular: true,
    ),
    Hotel(
      id: "2",
      name: "Grand Luxury Suite",
      location: "Gulberg III, Lahore",
      rating: 4.6,
      price: 8500,
      priceDisplay: "Rs. 8,500/night",
      mainImage: "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1590490360182-c33d57733427?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Steam", "Restaurant", "Gym"],
      description: "Modern elegance meets comfort in our beautifully designed suites. Perfect for business travelers and families alike.",
      discount: "15% OFF",
      isPopular: false,
    ),
    Hotel(
      id: "3",
      name: "Pearl Continental",
      location: "The Mall, Lahore",
      rating: 4.9,
      price: 15000,
      priceDisplay: "Rs. 15,000/night",
      mainImage: "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Pool", "Spa", "Gym", "Restaurant"],
      description: "The epitome of luxury hospitality in Lahore. Our flagship property offers unmatched service and premium amenities.",
      discount: "25% OFF",
      isPopular: true,
    ),
    Hotel(
      id: "4",
      name: "Comfort Inn",
      location: "Johar Town, Lahore",
      rating: 4.2,
      price: 6000,
      priceDisplay: "Rs. 6,000/night",
      mainImage: "https://images.unsplash.com/photo-1596436889106-be35e843f974?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1596436889106-be35e843f974?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Restaurant", "Gym"],
      description: "Affordable comfort without compromising on quality. Perfect for budget-conscious travelers seeking great value.",
      isPopular: false,
    ),

    // Nearby Hotels
    Hotel(
      id: "5",
      name: "Heritage Hotel",
      location: "Anarkali Bazaar, Lahore",
      rating: 4.4,
      price: 7500,
      priceDisplay: "Rs. 7,500/night",
      mainImage: "https://images.unsplash.com/photo-1549294413-26f195200c16?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1549294413-26f195200c16?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1560472354-b33ff0c44a43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1584132967334-10e028bd69f7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Restaurant", "Spa"],
      description: "Step into history with our heritage property that combines traditional architecture with modern amenities.",
      isPopular: true,
    ),
    Hotel(
      id: "6",
      name: "City Center Hotel",
      location: "Liberty Market, Lahore",
      rating: 4.3,
      price: 9000,
      priceDisplay: "Rs. 9,000/night",
      mainImage: "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Pool", "Gym", "Restaurant"],
      description: "Conveniently located in the bustling Liberty Market area with easy access to shopping and dining.",
      isPopular: false,
    ),
    Hotel(
      id: "7",
      name: "Garden View Resort",
      location: "Model Town, Lahore",
      rating: 4.7,
      price: 11000,
      priceDisplay: "Rs. 11,000/night",
      mainImage: "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1584132915807-fd1f5fbc078f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Pool", "Spa", "Steam", "Restaurant"],
      description: "Escape to tranquility in our garden resort setting while staying close to the city center.",
      isPopular: true,
    ),
    Hotel(
      id: "8",
      name: "Business Inn",
      location: "DHA Phase 5, Lahore",
      rating: 4.1,
      price: 5500,
      priceDisplay: "Rs. 5,500/night",
      mainImage: "https://images.unsplash.com/photo-1559599101-f09722fb4948?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1559599101-f09722fb4948?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1561501900-3701fa6a0864?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Gym", "Restaurant"],
      description: "Designed for the modern business traveler with all essential amenities and excellent connectivity.",
      isPopular: false,
    ),
    Hotel(
      id: "9",
      name: "Riverside Lodge",
      location: "Canal Bank, Lahore",
      rating: 4.5,
      price: 8000,
      priceDisplay: "Rs. 8,000/night",
      mainImage: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1590490359683-658d3d23f972?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Pool", "Restaurant", "Spa"],
      description: "Enjoy serene canal views from our riverside location while being minutes away from major attractions.",
      isPopular: true,
    ),
    Hotel(
      id: "10",
      name: "Economy Stay",
      location: "Ferozepur Road, Lahore",
      rating: 3.9,
      price: 4000,
      priceDisplay: "Rs. 4,000/night",
      mainImage: "https://images.unsplash.com/photo-1455587734955-081b22074882?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      images: [
        "https://images.unsplash.com/photo-1455587734955-081b22074882?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
        "https://images.unsplash.com/photo-1587985064135-0366536eab42?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80",
      ],
      amenities: ["WiFi", "Restaurant"],
      description: "Clean, comfortable, and affordable accommodation for budget travelers and extended stays.",
      isPopular: false,
    ),
  ];

  // Get recommended hotels (first 4 hotels)
  static List<Hotel> getRecommendedHotels() {
    return _allHotels.take(4).toList();
  }

  // Get nearby hotels (hotels 5-10)
  static List<Hotel> getNearbyHotels() {
    return _allHotels.skip(4).toList();
  }

  // Get hotel by ID
  static Hotel? getHotelById(String id) {
    try {
      return _allHotels.firstWhere((hotel) => hotel.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get all hotels
  static List<Hotel> getAllHotels() {
    return _allHotels;
  }

  // Search hotels by name or location
  static List<Hotel> searchHotels(String query) {
    return _allHotels.where((hotel) {
      return hotel.name.toLowerCase().contains(query.toLowerCase()) ||
          hotel.location.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  // Get popular hotels
  static List<Hotel> getPopularHotels() {
    return _allHotels.where((hotel) => hotel.isPopular).toList();
  }

  // Get hotels by price range
  static List<Hotel> getHotelsByPriceRange(int minPrice, int maxPrice) {
    return _allHotels.where((hotel) {
      return hotel.price >= minPrice && hotel.price <= maxPrice;
    }).toList();
  }

  // Get hotels with specific amenity
  static List<Hotel> getHotelsWithAmenity(String amenity) {
    return _allHotels.where((hotel) {
      return hotel.amenities.any((a) => a.toLowerCase().contains(amenity.toLowerCase()));
    }).toList();
  }
}