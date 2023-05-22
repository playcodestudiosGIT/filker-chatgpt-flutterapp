import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? colorText;

  const LinkText({
    super.key,
    required this.text,
    required this.fontSize,
    this.colorText = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.manrope(fontSize: fontSize, color: colorText, fontWeight: FontWeight.bold));
  }
}
