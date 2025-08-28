import 'package:flutter/material.dart';
import 'navbar_item.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          NavbarItem(icon: Icons.home, label: "Home", isSelected: true),
          NavbarItem(icon: Icons.library_music, label: "Library"),
          NavbarItem(icon: Icons.collections, label: "Collection"),
          NavbarItem(icon: Icons.search, label: "Search"),
          NavbarItem(icon: Icons.settings, label: "Setting"),
        ],
      ),
    );
  }
}
