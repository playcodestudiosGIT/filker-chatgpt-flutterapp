
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/generales.dart';
import '../widgets/suscribe_bar.dart';
import 'home/argumento_test.dart';
import 'home/logos_section.dart';
import 'home/tools_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final chatProvider = Provider.of<ChatProvider>(context);
    final wSize = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: (wSize > 560) ? 1350 : 1350,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                  Generales.pColor.withOpacity(0.1),
                  Colors.transparent,
                ]),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SuscribeBar(),
                _Titulos(),
                ArgumentoTest(),
                SizedBox(height: 40),
                _AboutUs(),
                SizedBox(height: 40),
                ToolsSection(),
                SizedBox(height: 100),
                LogosSection(),
                SizedBox(height: 200),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class _AboutUs extends StatelessWidget {
  const _AboutUs();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      constraints: const BoxConstraints(maxWidth: 800, minWidth: 360),
      child: Text(
        'Filker es la plataforma de streaming y marketplace que te permite  contar, ver y monetizar tus historias con apoyo profesional e inversión privada',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(color: const Color(0XFFA3A3A3), fontSize: 20, fontWeight: FontWeight.w300, letterSpacing: 3),
      ),
    );
  }
}

class _Titulos extends StatelessWidget {
  const _Titulos();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Text('SIEMPRE TENEMOS ALGO PARA CONTAR',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(letterSpacing: 2, fontSize: 26, color: Generales.pColor, fontWeight: FontWeight.w800)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('¿Cual es la historia de hoy?',
              textAlign: TextAlign.center, style: GoogleFonts.manrope(fontSize: 38, color: Colors.black87, fontWeight: FontWeight.w800)),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
