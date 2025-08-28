import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../models/hotel.dart';
import '../models/user_location.dart';
import '../services/hotel_service.dart';
import 'hotel_detail_screen.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen>
    with TickerProviderStateMixin {
  late UserLocation currentLocation;
  late List<Hotel> recommendedHotels;
  late List<Hotel> nearbyHotels;
  late AnimationController _controller;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadData() async {
    // Simulate loading delay for better animation effect
    await Future.delayed(const Duration(milliseconds: 300));
    currentLocation = HotelService.getCurrentLocation();
    recommendedHotels = HotelService.getRecommendedHotels();
    nearbyHotels = HotelService.getNearbyHotels();
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              pinned: false,
              expandedHeight: 90,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                                  .animate()
                                  .fadeIn(duration: 600.ms, delay: 200.ms)
                                  .moveX(begin: -50, end: 0),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on, color: Colors.orange, size: 18)
                                      .animate()
                                      .scale(delay: 400.ms, duration: 300.ms)
                                      .then()
                                      .shake(hz: 2, curve: Curves.easeInOutCubic),
                                  const SizedBox(width: 4),
                                  Text(
                                    _isLoaded ? currentLocation.displayName : 'Loading...',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                      .animate()
                                      .fadeIn(duration: 600.ms, delay: 300.ms)
                                      .moveX(begin: -50, end: 0),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20)
                                      .animate(delay: 500.ms)
                                      .fadeIn()
                                      .moveY(begin: -10, end: 0),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              children: [
                                const Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                                Positioned(
                                  top: 0,
                                  right: 2,
                                  child: Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                      .animate(onPlay: (controller) => controller.repeat())
                                      .scale(duration: 1000.ms)
                                      .then()
                                      ..scale(begin: const Offset(1.0, 1.0), end: const Offset(0.8, 0.8), duration: 1000.ms),
                                ),
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 600.ms, delay: 400.ms)
                              .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0))
                              .then()
                              .shimmer(delay: 2000.ms, duration: 1500.ms),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: !_isLoaded
            ? Center(
            child: CircularProgressIndicator(color: Colors.orange)
                .animate()
                .scale(duration: 300.ms)
                .then()
                .shake())
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey, size: 30)
                          .animate()
                          .scale(delay: 600.ms, duration: 300.ms),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Search',
                          style: TextStyle(color: Colors.grey, fontSize: 22),
                        ),
                      )
                          .animate()
                          .fadeIn(delay: 700.ms, duration: 400.ms)
                          .slideX(begin: 0.3, end: 0),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.tune, color: Colors.white, size: 30),
                      )
                          .animate()
                          .scale(delay: 800.ms, duration: 400.ms, curve: Curves.elasticOut)
                          .then()
                          .shimmer(delay: 1000.ms, duration: 1500.ms),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 500.ms)
                    .moveY(begin: 30, end: 0)
                    .scale(begin: const Offset(0.95, 0.95), end: const Offset(1.0, 1.0)),

                const SizedBox(height: 24),

                // Recommended Hotel Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended Hotel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.black,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 700.ms)
                        .moveX(begin: -50, end: 0),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange[600],
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 800.ms)
                        .moveX(begin: 50, end: 0)
                        .then()
                        .shimmer(delay: 2000.ms, duration: 1000.ms),
                  ],
                ),

                const SizedBox(height: 18),

                // Recommended Hotels
                SizedBox(
                  height: 200,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedHotels.length,
                      itemBuilder: (context, index) {
                        final hotel = recommendedHotels[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 600),
                          delay: Duration(milliseconds: 100 * index),
                          child: SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: index < recommendedHotels.length - 1 ? 16 : 0),
                                child: _buildRecommendedHotelCard(hotel),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Nearby Hotel Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby Hotel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.black,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 1200.ms)
                        .moveX(begin: -50, end: 0),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange[600],
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 1300.ms)
                        .moveX(begin: 50, end: 0)
                        .then()
                        .shimmer(delay: 2000.ms, duration: 1000.ms),
                  ],
                ),

                const SizedBox(height: 16),

                // Nearby Hotel Cards
                AnimationLimiter(
                  child: Column(
                    children: nearbyHotels.asMap().entries.map((entry) {
                      int index = entry.key;
                      Hotel hotel = entry.value;
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 800),
                        delay: Duration(milliseconds: 200 * index + 1400),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _buildNearbyHotelCard(hotel),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            currentIndex: 0,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Orders',
              ),
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(duration: 800.ms, delay: 1000.ms)
          .moveY(begin: 100, end: 0),
    );
  }

  Widget _buildRecommendedHotelCard(Hotel hotel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailScreen(hotelId: hotel.id),
          ),
        );
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel Image
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  hotel.mainImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.hotel, color: Colors.grey[600]),
                    );
                  },
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 400.ms)
                .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0), curve: Curves.elasticOut),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating and Discount badge
                    Row(
                      children: [
                        if (hotel.discount != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Text(
                              hotel.discount!,
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 9,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                              .animate()
                              .fadeIn(delay: 300.ms)
                              .scale(begin: const Offset(0.5, 0.5), end: const Offset(1.0, 1.0))
                              .then()
                              .shimmer(delay: 1000.ms, duration: 1500.ms),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star, color: Colors.orange, size: 12)
                                  .animate(onPlay: (controller) => controller.repeat())
                                  .rotate(duration: 2000.ms, delay: 2000.ms)
                                  .then()
                                  .rotate(begin: 1.0, end: 0.0, duration: 2000.ms),
                              const SizedBox(width: 4),
                              Text(
                                hotel.rating.toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(delay: 400.ms)
                            .scale(begin: const Offset(0.5, 0.5), end: const Offset(1.0, 1.0)),
                      ],
                    ),

                    // Hotel Name
                    Text(
                      hotel.name,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 400.ms)
                        .slideY(begin: 0.3, end: 0),

                    // Location
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 10, color: Colors.grey)
                            .animate()
                            .scale(delay: 300.ms, duration: 200.ms),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            hotel.location,
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                              .animate()
                              .fadeIn(delay: 400.ms, duration: 400.ms)
                              .slideX(begin: 0.3, end: 0),
                        ),
                      ],
                    ),

                    // Price
                    Text(
                      hotel.priceDisplay,
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 400.ms)
                        .slideY(begin: 0.3, end: 0)
                        .then()
                        .shimmer(delay: 1500.ms, duration: 1000.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
          .animate()
          .scale(begin: const Offset(0.9, 0.9), end: const Offset(1.0, 1.0), curve: Curves.elasticOut)
          .then()
          .shimmer(delay: 3000.ms, duration: 2000.ms),
    );
  }

  Widget _buildNearbyHotelCard(Hotel hotel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailScreen(hotelId: hotel.id),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Hotel Image
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.network(
                  hotel.mainImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(Icons.hotel, color: Colors.grey[600]),
                    );
                  },
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 400.ms)
                .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.0, 1.0), curve: Curves.elasticOut),

            const SizedBox(width: 12),

            // Hotel Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Popular badge and rating
                  Row(
                    children: [
                      if (hotel.isPopular)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'POPULAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                            .animate()
                            .fadeIn(delay: 200.ms)
                            .scale(begin: const Offset(0.5, 0.5), end: const Offset(1.0, 1.0))
                            .then()
                            .shimmer(delay: 1000.ms, duration: 1500.ms),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star, color: Colors.orange, size: 12)
                                .animate(onPlay: (controller) => controller.repeat())
                                .rotate(duration: 2000.ms, delay: 1000.ms)
                                .then()
                                .rotate(begin: 1.0, end: 0.0, duration: 2000.ms),
                            const SizedBox(width: 4),
                            Text(
                              hotel.rating.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(delay: 300.ms)
                          .scale(begin: const Offset(0.5, 0.5), end: const Offset(1.0, 1.0)),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Hotel Name
                  Text(
                    hotel.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 100.ms, duration: 400.ms)
                      .slideX(begin: 0.3, end: 0),

                  const SizedBox(height: 4),

                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 12, color: Colors.grey)
                          .animate()
                          .scale(delay: 200.ms, duration: 200.ms),
                      const SizedBox(width: 2),
                      Text(
                        hotel.location,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      )
                          .animate()
                          .fadeIn(delay: 300.ms, duration: 400.ms)
                          .slideX(begin: 0.3, end: 0),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Price
                  Text(
                    hotel.priceDisplay,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                      .animate()
                      .fadeIn(delay: 400.ms, duration: 400.ms)
                      .slideX(begin: 0.3, end: 0)
                      .then()
                      .shimmer(delay: 1500.ms, duration: 1000.ms),
                ],
              ),
            ),
          ],
        ),
      )
          .animate()
          .scale(begin: const Offset(0.95, 0.95), end: const Offset(1.0, 1.0), curve: Curves.elasticOut)
          .then()
          .shimmer(delay: 3000.ms, duration: 2000.ms),
    );
  }
}