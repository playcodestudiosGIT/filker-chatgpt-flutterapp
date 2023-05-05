import 'package:fliker/constants/generales.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TarjetaToolsHome extends StatelessWidget {
  final String title;
  final Image icon;
  final Color color;
  const TarjetaToolsHome({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final wSize = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: (wSize < 450) ? 150 : 200,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)]),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                color: color,
              ),
              width: double.infinity,
              height: 250 * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      width: 100,
                      height: 100,
                      child: icon),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.mulish(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
              ),
              child: Center(
                  child: Container(
                width: 130,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Generales.pColor,
                ),
                child: Center(
                  child: Text(
                    'Explorar',
                    style: GoogleFonts.mulish(color: Colors.white, fontSize: 18),
                  ),
                ),
              )),
            ))
          ],
        ),
      ),
    );
  }
}
