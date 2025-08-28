import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const NavbarItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
            size: 30,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 14,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
          ),
        ),
      ],
    );
  }
}