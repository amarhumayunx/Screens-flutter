import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../models/hotel.dart';
import '../services/hotel_service.dart';

class HotelDetailScreen extends StatefulWidget {
  final String hotelId;

  const HotelDetailScreen({Key? key, required this.hotelId}) : super(key: key);

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  Hotel? hotel;
  int currentImageIndex = 0;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadHotelData();
  }

  void _loadHotelData() {
    setState(() {
      hotel = HotelService.getHotelById(widget.hotelId);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (hotel == null) {
      return Scaffold(
        body: Center(
          child: Text(
            'Hotel not found',
            style: TextStyle(
              fontSize: 18,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: hotel!.images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: hotel!.images[index].startsWith('http')
                            ? Image.network(
                          hotel!.images[index],
                          fit: BoxFit.cover,
                        )
                            : Image.asset(
                          hotel!.images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms, curve: Curves.easeIn)
                        .scale(duration: 700.ms, curve: Curves.easeOutBack);
                  },
                ),

                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: _circleButton(Icons.arrow_back, Colors.black),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: _circleButton(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              isFavorite ? Colors.red : Colors.black,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Share ${hotel!.name}')),
                              );
                            },
                            child: _circleButton(Icons.share, Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(hotel!.images.length, (index) {
                      return Container(
                        width: index == currentImageIndex ? 20 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: index == currentImageIndex
                              ? Colors.white
                              : Colors.white54,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hotel Name + Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            hotel!.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                hotel!.rating.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .slideY(begin: 0.3, duration: 500.ms)
                        .fadeIn(duration: 500.ms),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.grey[500], size: 16),
                            const SizedBox(width: 4),
                            Text(
                              hotel!.location,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Rs. ${hotel!.price}',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .slideX(begin: 0.3, duration: 600.ms)
                        .fadeIn(duration: 600.ms),

                    const SizedBox(height: 20),

                    Text(
                      'What this place offers',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 15),

                    AnimationLimiter(
                      child: Row(
                        children:
                        AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 600),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(child: widget),
                          ),
                          children: hotel!.amenities.take(3).map((amenity) {
                            IconData icon;
                            switch (amenity.toLowerCase()) {
                              case 'wifi':
                                icon = Icons.wifi;
                                break;
                              case 'pool':
                                icon = Icons.pool;
                                break;
                              case 'steam':
                                icon = Icons.hot_tub;
                                break;
                              case 'gym':
                                icon = Icons.fitness_center;
                                break;
                              case 'spa':
                                icon = Icons.spa;
                                break;
                              case 'restaurant':
                                icon = Icons.restaurant;
                                break;
                              default:
                                icon = Icons.star;
                            }
                            return Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: _buildAmenity(
                                  icon, amenity, Colors.orange),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 12),

                    RichText(
                      text: TextSpan(
                        text: hotel!.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: ' Read more',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.orange,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideY(begin: 0.2, duration: 600.ms),

                    const SizedBox(height: 110),

                    Container(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Book ${hotel!.name}'),
                              content: Text(
                                  'Booking ${hotel!.name} for Rs. ${hotel!.price}'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                          content:
                                          Text('Booking confirmed!')),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                  ),
                                  child: const Text('Confirm'),
                                ),
                              ],
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .scale(
                        begin: const Offset(0.8, 0.8),
                        duration: 500.ms,
                        curve: Curves.easeOutBack)
                        .fadeIn(duration: 400.ms),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _circleButton(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _buildAmenity(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 70,
            height: 60,
            child: Icon(icon, color: color, size: 35),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
