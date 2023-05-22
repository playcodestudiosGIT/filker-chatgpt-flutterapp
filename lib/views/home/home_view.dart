import 'package:fliker/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/generales.dart';
import '../../providers/chat_provider.dart';
import '../../widgets/suscribe_bar.dart';
import 'argumento_test.dart';
import 'logos_section.dart';
import 'tools_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ChatProvider>(context, listen: false).indexArgumentGenerator = 0;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (authProvider.authStatus != AuthStatus.authenticated)
            const SuscribeBar(),
            const _Titulos(),
            const ArgumentoTest(),
            const SizedBox(height: 40),
            const _AboutUs(),
            const SizedBox(height: 40),
            const ToolsSection(),
            const SizedBox(height: 100),
            const LogosSection(),
            const SizedBox(height: 200),
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
