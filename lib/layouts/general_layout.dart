import 'package:fliker/constants/generales.dart';
import 'package:fliker/widgets/botones/darkmode_button.dart';
import 'package:fliker/widgets/botones/login_button.dart';
import 'package:fliker/widgets/botones/share_button.dart';
import 'package:fliker/widgets/vertical_divider_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralLayout extends StatelessWidget {
  final Widget child;
  const GeneralLayout({super.key, required this.child});

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
            LoginButton(text: 'Log in' , onPressed: (){},),
            if (size.width > 445) const SizedBox(width: 40)
          ],
        ),
        body: child,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          color: Generales.pColor,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('Contacto', style: GoogleFonts.manrope(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text('Políticas de Privacidad', style: GoogleFonts.manrope(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text('Términos y condiciones', style: GoogleFonts.manrope(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text('Nosotros', style: GoogleFonts.manrope(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text('Descarga Resumen', style: GoogleFonts.manrope(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}
