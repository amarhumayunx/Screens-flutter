import 'dart:ui';

import 'package:flutter/material.dart';

class GlassButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final double size;
  final bool isPlayButton;

  const GlassButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.size = 45,
    this.isPlayButton = false,
  }) : super(key: key);

  @override
  _GlassButtonState createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: widget.isPlayButton
              ? LinearGradient(
            colors: [
              Color(0xFFff6b6b),
              Color(0xFFee5a24),
            ],
          )
              : null,
          color: widget.isPlayButton
              ? null
              : Colors.white.withOpacity(isPressed ? 0.25 : 0.15),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
            if (widget.isPlayButton)
              BoxShadow(
                color: Color(0xFFff6b6b).withOpacity(0.3),
                blurRadius: 20,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.size / 2),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(child: widget.child),
            ),
          ),
        ),
      ),
    );
  }
}