import 'package:fliker/constants/generales.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final ImageProvider? bg;
  final onPressed;
  final IconData icon;
  const CircleButton({super.key, required this.icon, required this.onPressed, this.bg});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 35,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: Generales.pColor, width: 1), color: const Color(0xFFF1F1F1), borderRadius: BorderRadius.circular(100)),
          child: (bg != null)
          ? ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(image: bg!, fit: BoxFit.cover,))
          
          : Icon(
            icon,
            size: 20,
            color: Generales.pColor,
          ),
        ),
      ),
    );
  }
}
