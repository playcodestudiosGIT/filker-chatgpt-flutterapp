import 'package:fliker/constants/generales.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CardHome extends StatelessWidget {
  final String title, sinopsis, generoDuracion, nombre;
  final AssetImage baner, profile, ausp;
  const CardHome({
    super.key,
    required this.title,
    required this.sinopsis,
    required this.generoDuracion,
    required this.nombre,
    required this.baner,
    required this.profile,
    required this.ausp,
  });

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(35)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 261,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        child: Image(
                          image: baner,
                          fit: BoxFit.cover,
                        ))),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: (wSize < 450) ? 280 : 290,
                    height: 30,
                    color: Colors.white,
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 20,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0XFF271B7F),
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 45,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: 360,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sinopsis',
                      style: GoogleFonts.poppins(
                        color: Generales.pColor,
                        fontSize: (wSize < 450) ? 12 : 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      sinopsis,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.mulish(
                        color: Generales.lightColorText,
                        fontSize: (wSize < 450) ? 12 : 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      generoDuracion,
                      style: GoogleFonts.poppins(
                        color: Generales.lightColorText,
                        fontSize: (wSize < 450) ? 12 : 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Generales.fillinputColors,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            nombre,
                            style: GoogleFonts.mulish(color: const Color(0XFF737A99)),
                          ),
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Image(image: profile),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'AUSPICIA',
                    style: GoogleFonts.poppins(fontSize: 8, color: Generales.lightColorText, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(width: 8),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: SizedBox(width: 55, child: Image(image: ausp)),
                  ),
                  const SizedBox(width: 20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
