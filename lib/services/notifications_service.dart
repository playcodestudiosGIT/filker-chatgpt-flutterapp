import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsServices {
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message, Color color) {
    final snackBar = SnackBar(
      backgroundColor: color,
        content: Text(
      message,
      style: GoogleFonts.manrope(color: Colors.white, fontSize: 20),
    ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
