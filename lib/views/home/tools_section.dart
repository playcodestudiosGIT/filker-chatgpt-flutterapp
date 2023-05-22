import 'package:fliker/constants/generales.dart';
import 'package:fliker/widgets/cards/tarjeta_tools_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ToolsSection extends StatelessWidget {
  const ToolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(width: double.infinity, height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Wrap(alignment: WrapAlignment.center, children: [
            Text(
              'Imagina, Crea, Mira Y Comparte tu historia con',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(fontSize: 36, color: Colors.black87, fontWeight: FontWeight.w800),
            ),
            const SizedBox(width: 10),
            Text('FILKER', style: GoogleFonts.manrope(letterSpacing: 2, fontSize: 38, color: Generales.pColor, fontWeight: FontWeight.w800)),
          ]),
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            child: Text(
              'Imagina con herramientas de inteligencia artificial y crealas en una red para conectar historias y contarlas de una manera única y creativa de monetizarlas. Una combinación de tecnología y humanidad para brindar una experiencia de usuario completa.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 80,
          color:Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350, maxHeight: 55),
                // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                // height: 55,
                // width: 350,
                child: DecoratedBox(
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(style: BorderStyle.none),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Generales.lightColorText),
                      decoration: Generales.ipdec(
                        labelText: 'Buscar herramienta',
                        hintText: 'Que herramienta deseas buscar',
                        icon: Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Generales.pColor,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Container(
          constraints: const BoxConstraints(maxWidth: 1200, minWidth: 360, maxHeight: 780, minHeight: 280),
          child: const Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 15,
            children: [
              TarjetaToolsHome(
                color: Color(0xff6F56EC),
                icon: Image(
                  image: AssetImage('/images/ideaicon.png'),
                ),
                title: 'Generar Ideas',
              ),
              TarjetaToolsHome(
                color: Color(0xffC585F3),
                icon: Image(
                  image: AssetImage('/images/imanicon.png'),
                ),
                title: 'Generar Sinopsis',
              ),
              TarjetaToolsHome(
                color: Color(0xffAA4F9C),
                icon: Image(
                  image: AssetImage('/images/peopleicon.png'),
                ),
                title: 'Crea Personajes',
              ),
              TarjetaToolsHome(
                color: Color(0xffE05E5E),
                icon: Image(
                  image: AssetImage('/images/listicon.png'),
                ),
                title: 'Crear Escenas y Secuencias',
              ),
              TarjetaToolsHome(
                color: Color(0xffFFB55E),
                icon: Image(
                  image: AssetImage('/images/chaticon.png'),
                ),
                title: 'Crea Dialogos',
              ),
              TarjetaToolsHome(
                color: Color(0xff8A58B7),
                icon: Image(
                  image: AssetImage('/images/todoicon.png'),
                ),
                title: 'Generar Storyboards',
              ),
            ],
          ),
        )
      ],
    );
  }
}
