import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFoundScreen extends StatelessWidget {
const PageNotFoundScreen({super.key});

   @override
   Widget build(BuildContext context) {
      return Center(
        child: Container(
        child: Text('404 - Pagina no encontrada', style: GoogleFonts.montserratAlternates(
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),),
        ),
      );
   }
}