import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Generales {
  static String MODELS_URL = 'https://api.openai.com/v1/models';
  static String REQ_URL = 'https://api.openai.com/v1/chat/completions';
  static String API_KEY = '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';


  static Color pColor = const Color(0XFF7565FD);
  static Color sColor = const Color(0xFF55368C);
  static Color lightColorText = const Color(0xFFA9A9A9);
  static Color fillinputColors = const Color(0xFFF1F1F1);
  static String noImage = 'https://res.cloudinary.com/dyh2rft5v/image/upload/v1684718904/system/noimage_jlk5pf.jpg';

  static TextStyle menuDesplegableTexto = TextStyle(color: pColor);

  static InputDecoration ipdec({required String labelText, required String hintText, Icon? icon, IconButton? sufIcon}) => InputDecoration(
      suffixIcon: sufIcon,
      icon: icon,
      fillColor: fillinputColors,
      filled: true,
      hintStyle: const TextStyle(color: Colors.black26),
      label: Text(labelText, style: GoogleFonts.manrope(color: Generales.lightColorText),),
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(width: 8, color: Colors.green.withOpacity(1))),
      focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
          borderSide: BorderSide(width: 3, color: Generales.pColor.withOpacity(0.3))),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(width: 1, color: Generales.pColor.withOpacity(0.3))));

  static ShapeDecoration myCustomShapeDec() => ShapeDecoration(
      // color: Generales.pColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Generales.pColor),
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      ),
    );
}





// mongodb Atlas
// filmsprompt
// tdbpUZ6hLDGlgcQT