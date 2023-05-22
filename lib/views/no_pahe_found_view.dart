import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFoundScreen extends StatelessWidget {
const PageNotFoundScreen({super.key});

   @override
   Widget build(BuildContext context) {
      return Center(
        child: SizedBox(
          width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('images/logo.png')),
            const SizedBox(height: 15),
            Text(
              '404 - Pagina no encontrada',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
        ),
      );
   }
}