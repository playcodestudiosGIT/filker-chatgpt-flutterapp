import 'package:fliker/constants/generales.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProyectoCard extends StatelessWidget {
  final String tipo;
  final String titulo;
  final String sinopsis;
  final int escenas;
  const ProyectoCard({
    super.key,
    this.tipo = 'Cortometraje',
    this.titulo = 'Titulo: Titulo del Proyecto',
    this.sinopsis =
        'Sinopsis: Fugiat excepteur aliquip incididunt do. Minim exercitation enim magna sit mollit duis ad esse irure. Consectetur in incididunt ea duis laboris culpa. Cupidatat in ipsum ipsum culpa amet est ullamco aliquip reprehenderit dolore enim laboris. Exercitation aute proident ipsum mollit qui.',
    this.escenas = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 400,
            height: 300,
            margin: const EdgeInsets.all(7),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    tipo,
                    style: GoogleFonts.manrope(fontSize: 18),
                  ),
                  const Spacer(),
                  Text(
                    'Guion Literario',
                    style: GoogleFonts.manrope(fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                titulo,
                style: GoogleFonts.manrope(color: Generales.lightColorText, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Text(
                'Sinopsis: \n$sinopsis',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.manrope(color: Generales.lightColorText, fontSize: 14),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        const Icon(Icons.screenshot_monitor),
                        const SizedBox(width: 8),
                        FittedBox(child: Text('Escenas: $escenas')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        Icon(Icons.person_pin_outlined),
                        SizedBox(width: 8),
                        FittedBox(child: Text('Personajes: 3')),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: 8),
                        FittedBox(child: Text('Locaciones: 1')),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}


