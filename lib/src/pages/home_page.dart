import 'package:fliker/src/pages/sections/logos_section.dart';
import 'package:fliker/src/pages/sections/tools_section.dart';
import 'package:fliker/src/widgets/botones/darkmode_button.dart';
import 'package:fliker/src/widgets/botones/login_button.dart';
import 'package:fliker/src/widgets/botones/share_button.dart';
import 'package:fliker/src/widgets/suscribe_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/generales.dart';
import '../widgets/vertical_divider_appbar.dart';
import 'sections/argumento_test.dart';

class HommePage extends StatelessWidget {
  const HommePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        backgroundColor: const Color(0xFFF1F1F1),
        title: Padding(
          padding: (size.width > 445) ? const EdgeInsets.only(left: 30) : const EdgeInsets.only(left: 0),
          child: const Image(
            image: AssetImage('images/logo.png'),
            width: 100,
          ),
        ),
        actions: [
          const DarkModeButton(),
          const SizedBox(width: 10),
          const ShareButton(),
          const SizedBox(width: 10),
          const VerticalDividerAppbar(),
          const SizedBox(width: 10),
          const LoginButton(text: 'Log in'),
          if (size.width > 445) const SizedBox(width: 40)
        ],
      ),
      body: const _MyBody(),
    );
  }
}

class _MyBody extends StatelessWidget {
  const _MyBody();

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
