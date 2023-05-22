import 'package:fliker/constants/generales.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final onPressed;
  const NormalButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: 110,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              border: Border.fromBorderSide(BorderSide(style: BorderStyle.solid, color: Generales.pColor))
            ),
          child: Text(
            text,
            style: GoogleFonts.mulish(color: Generales.pColor),
          ),
        ),
      ),
    );
  }
}
