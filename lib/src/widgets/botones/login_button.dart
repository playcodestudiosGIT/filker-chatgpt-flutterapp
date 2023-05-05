import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final String text;
  const LoginButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      width: 110,
      height: 35,
      decoration: const BoxDecoration(
          color: Color(0xFF7565FD),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(100),
          )),
      child: Text(
        text,
        style: GoogleFonts.mulish(color: Colors.white),
      ),
    );
  }
}
