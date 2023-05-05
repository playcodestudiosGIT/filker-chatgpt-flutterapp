import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogosSection extends StatelessWidget {
  const LogosSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;
    final hSize = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 800, minWidth: 360),
          child: Text(
            'Tu creatividad tiene el poder de inspirar y conectar con el mundo',
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(fontSize: 36, color: Colors.black87, fontWeight: FontWeight.w800),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            child: Text(
              'Utiliza herramientas innovadoras para el desarrollo de tus proyectos creativos,  combina herramientas de inteligencia artificial y una amplia red de profesionales altamente calificados para lograr el mejor resultado y consigue financiamiento de inversión privada para llevar tus ideas a la pantalla con',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: 180,
          height: 55,
          decoration: const BoxDecoration(
              color: Color(0xFF7963E0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              )),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Crear Historia',
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        SizedBox(
          width: wSize,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 460, maxHeight: 460, minWidth: 200, minHeight: 200),
                  child: const Image(
                    image: AssetImage('/images/img1.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 460, maxHeight: 460, minWidth: 200, minHeight: 200),
                  child: const Image(
                    image: AssetImage('/images/img2.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 460, maxHeight: 460, minWidth: 200, minHeight: 200),
                  child: const Image(
                    image: AssetImage('/images/img3.png'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Image(image: AssetImage('/images/logo1.png')),
            Image(image: AssetImage('/images/logo2.png')),
            Image(image: AssetImage('/images/logo3.png')),
            Image(image: AssetImage('/images/logo4.png')),
            Image(image: AssetImage('/images/logo5.png')),
            Image(image: AssetImage('/images/logo6.png')),
          ]),
        ),
      ],
    );
  }
}
