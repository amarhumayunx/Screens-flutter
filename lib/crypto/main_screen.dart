import 'package:flutter/material.dart';
import 'dart:math' as math;

class MasterCryptoTradingScreen extends StatefulWidget {
  const MasterCryptoTradingScreen({Key? key}) : super(key: key);

  @override
  State<MasterCryptoTradingScreen> createState() => _MasterCryptoTradingScreenState();
}

class _MasterCryptoTradingScreenState extends State<MasterCryptoTradingScreen>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _glowController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    ));

    _glowAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _glowController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a1a1a),
              Color(0xFF0a0a0a),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Background network lines
                    CustomPaint(
                      painter: NetworkLinesPainter(),
                      size: Size.infinite,
                    ),

                    // Main content
                    Column(
                      children: [
                        const SizedBox(height: 60),

                        // Title
                        const Text(
                          'Master Crypto',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const Text(
                          'Trading',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),

                        const SizedBox(height: 80),

                        // 3D Cubes
                        Expanded(
                          child: Center(
                            child: AnimatedBuilder(
                              animation: Listenable.merge([_rotationAnimation, _glowAnimation]),
                              builder: (context, child) {
                                return Stack(
                                  children: [
                                    // Large center cube
                                    Positioned(
                                      left: MediaQuery.of(context).size.width / 2 - 60,
                                      top: 150,
                                      child: _buildGlowingCube(
                                        size: 120,
                                        rotation: _rotationAnimation.value,
                                        glowIntensity: _glowAnimation.value,
                                      ),
                                    ),

                                    // Top left cube
                                    Positioned(
                                      left: 60,
                                      top: 50,
                                      child: _buildGlowingCube(
                                        size: 80,
                                        rotation: _rotationAnimation.value + math.pi / 4,
                                        glowIntensity: _glowAnimation.value * 0.7,
                                      ),
                                    ),

                                    // Top right cube
                                    Positioned(
                                      right: 60,
                                      top: 80,
                                      child: _buildGlowingCube(
                                        size: 70,
                                        rotation: _rotationAnimation.value - math.pi / 3,
                                        glowIntensity: _glowAnimation.value * 0.8,
                                      ),
                                    ),

                                    // Glowing dots
                                    ...List.generate(6, (index) {
                                      return Positioned(
                                        left: 50 + (index * 60).toDouble(),
                                        top: 200 + (math.sin(index + _rotationAnimation.value) * 30),
                                        child: _buildGlowingDot(),
                                      );
                                    }),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Start button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF7ED321),
                        Color(0xFF4A90E2),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7ED321).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle start button press
                      print('Start button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlowingCube({
    required double size,
    required double rotation,
    required double glowIntensity,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFF7ED321).withOpacity(0.4 * glowIntensity),
            blurRadius: 20,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: Color(0xFF7ED321).withOpacity(0.2 * glowIntensity),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(math.pi / 6)
          ..rotateY(rotation),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF2D5A2D).withOpacity(0.9),
                Color(0xFF1A3D1A).withOpacity(0.7),
                Color(0xFF0D2B0D).withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFF7ED321).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                // Highlight effect
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: size * 0.3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF7ED321).withOpacity(0.3 * glowIntensity),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlowingDot() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF7ED321),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF7ED321).withOpacity(0.6 * _glowAnimation.value),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}

class NetworkLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF7ED321).withOpacity(0.1)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Draw curved network lines
    for (int i = 0; i < 5; i++) {
      final startX = size.width * 0.1 * i;
      final startY = size.height * 0.2;
      final endX = size.width * 0.9 - (size.width * 0.1 * i);
      final endY = size.height * 0.8;

      path.moveTo(startX, startY);
      path.quadraticBezierTo(
        size.width / 2,
        size.height / 2 + (math.sin(i) * 50),
        endX,
        endY,
      );
    }

    // Additional connecting lines
    for (int i = 0; i < 3; i++) {
      path.moveTo(size.width * 0.2, size.height * 0.3 + (i * 80));
      path.lineTo(size.width * 0.8, size.height * 0.4 + (i * 60));
    }

    canvas.drawPath(path, paint);

    // Draw some nodes
    final nodePaint = Paint()
      ..color = const Color(0xFF7ED321).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.3), 3, nodePaint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.4), 3, nodePaint);
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.7), 3, nodePaint);
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.6), 3, nodePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}