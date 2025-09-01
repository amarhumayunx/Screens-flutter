import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformanceReportScreen extends StatelessWidget {
  const PerformanceReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D3E2D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(), // smooth iOS-like scrolling
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with back button and chat icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3F4F3F),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B8F47),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Title
                Text(
                  'Performance\nReport',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 52,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 30),

                // Spot Trading Card
                _buildTradingCard(
                  title: 'Spot Trading',
                  percentage: '12%',
                  profit: '+34 USDT',
                  color: const Color(0xFF3F4F3F),
                  isPositive: true,
                ),
                const SizedBox(height: 15),

                // Futures Trading Card (highlighted)
                _buildTradingCard(
                  title: 'Futures Trading',
                  percentage: '42%',
                  profit: '+1148 USDT',
                  color: const Color(0xFF9BCF53), // Bright green
                  isPositive: true,
                  isHighlighted: true,
                ),
                const SizedBox(height: 15),

                // Earn Card (negative)
                _buildTradingCard(
                  title: 'Earn',
                  percentage: '-6%',
                  profit: '-16 USDT',
                  color: const Color(0xFF3F4F3F),
                  isPositive: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTradingCard({
    required String title,
    required String percentage,
    required String profit,
    required Color color,
    required bool isPositive,
    bool isHighlighted = false,
  }) {
    return Container(
      width: double.infinity, // Changed from fixed 500 to full width
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Header row with title and arrow - Fixed overflow issue
          Row(
            children: [
              // Title and trend icon - wrapped in Expanded
              Expanded(
                child: Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: isHighlighted ? const Color(0xFF2D3E2D) : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isPositive
                            ? const Color(0xFF6B8F47)
                            : const Color(0xFFE74C3C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        isPositive ? Icons.trending_up : Icons.trending_down,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow icon
              Icon(
                Icons.arrow_outward,
                color: isHighlighted ? const Color(0xFF2D3E2D) : Colors.white,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Main content row - Fixed overflow issue
          Row(
            children: [
              // Percentage and subtitle - wrapped in Expanded
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      percentage,
                      style: TextStyle(
                        color: isHighlighted ? const Color(0xFF2D3E2D) : Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '24-Hour Profit Snapshot',
                      style: TextStyle(
                        color: isHighlighted
                            ? const Color(0xFF2D3E2D).withOpacity(0.7)
                            : Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      profit,
                      style: TextStyle(
                        color: isHighlighted ? const Color(0xFF2D3E2D) : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Chart area - kept fixed size
              SizedBox(
                width: 80,
                height: 40,
                child: CustomPaint(
                  painter: ChartPainter(
                    isPositive: isPositive,
                    isHighlighted: isHighlighted,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final bool isPositive;
  final bool isHighlighted;

  ChartPainter({required this.isPositive, required this.isHighlighted});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Set color based on positive/negative and highlighting
    if (isHighlighted) {
      paint.color = const Color(0xFF2D3E2D).withOpacity(0.8);
    } else if (isPositive) {
      paint.color = const Color(0xFF6B8F47);
    } else {
      paint.color = const Color(0xFFE74C3C);
    }

    final path = Path();

    // Create a wavy line pattern
    final points = <Offset>[];
    for (int i = 0; i <= 10; i++) {
      final x = (i / 10) * size.width;
      double y;

      if (isPositive) {
        // Upward trending wavy line
        y = size.height * 0.8 - (i * size.height * 0.05) +
            (size.height * 0.15 * (1 + 0.5 * (i % 3 - 1)));
      } else {
        // Downward trending wavy line
        y = size.height * 0.2 + (i * size.height * 0.05) +
            (size.height * 0.15 * (1 + 0.5 * (i % 3 - 1)));
      }

      points.add(Offset(x, y.clamp(0, size.height)));
    }

    // Draw the path
    if (points.isNotEmpty) {
      path.moveTo(points[0].dx, points[0].dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
    }

    canvas.drawPath(path, paint);

    // Add dotted line for negative trend
    if (!isPositive) {
      paint.strokeWidth = 1;
      paint.color = paint.color.withOpacity(0.5);

      final dottedPath = Path();
      for (int i = 0; i < points.length - 1; i++) {
        final start = points[i];
        final end = points[i + 1];
        final distance = (end - start).distance;
        final dashLength = 3.0;
        final gapLength = 3.0;

        double currentDistance = 0;
        bool isDash = true;

        while (currentDistance < distance) {
          final segmentLength = isDash ? dashLength : gapLength;
          final segmentEnd = (currentDistance + segmentLength).clamp(0.0, distance);

          if (isDash) {
            final segmentStart = Offset.lerp(start, end, currentDistance / distance)!;
            final segmentEndPoint = Offset.lerp(start, end, segmentEnd / distance)!;
            dottedPath.moveTo(segmentStart.dx, segmentStart.dy);
            dottedPath.lineTo(segmentEndPoint.dx, segmentEndPoint.dy);
          }

          currentDistance += segmentLength;
          isDash = !isDash;
        }
      }
      canvas.drawPath(dottedPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}