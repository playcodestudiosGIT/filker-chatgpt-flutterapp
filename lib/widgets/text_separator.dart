import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {
  final IconData icon;
  final String text;
  const TextSeparator({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                text,
                style: GoogleFonts.manrope(color: Colors.white.withOpacity(0.5), fontSize: 12),
              ),
              const Spacer(),
              Icon(
                icon,
                size: 14,
                color: Colors.white.withOpacity(0.5),
              )
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
