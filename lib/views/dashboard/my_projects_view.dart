import 'package:fliker/models/http/proyectos_respose.dart';
import 'package:fliker/providers/proyectos_provider.dart';
import 'package:fliker/widgets/cards/proyecto_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/generales.dart';

class MisProyectosView extends StatelessWidget {
  const MisProyectosView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Proyecto> misproyectos = Provider.of<ProyectosProvider>(context).proyectos;
    final destruct = misproyectos
        .map(
          (proyecto) => ProyectoCard(
            titulo: proyecto.titulo,
            tipo: 'Cortometraje',
            sinopsis: proyecto.sinopsis,
            escenas: proyecto.escenas.length,
          ),
        )
        .toList();
    return Container(
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
          Text(
            'Mis proyectos',
            style: GoogleFonts.manrope(color: Generales.lightColorText, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
            ...destruct
          ],)
        ],
      ),
    );
  }
}
