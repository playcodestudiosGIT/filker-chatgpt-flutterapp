import 'package:fliker/constants/generales.dart';
import 'package:fliker/widgets/botones/action_button.dart';
import 'package:fliker/widgets/botones/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuscribeButton extends StatelessWidget {
  const SuscribeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final alertDialog = AlertDialog(
      title: const Text('Suscripción Anticipada'),
      content: SizedBox(
        width: 330,
        height: 360,
        child: Column(
          children: [
            const Image(image: AssetImage('images/logogrande.png')),
            const SizedBox(height: 15),
            Text(
                'Con tu suscripción anticipada podras recibir información a cerca del desarrollo y las nuevas herramientas dispobibles, tambien podras optar por una cuenta en modo beta para testear la aplicacion sin limites.',
                style: GoogleFonts.manrope(color: Generales.lightColorText),
                ),
            const SizedBox(height: 15),
            Text(
                'SUSCRIBETE!',
                style: GoogleFonts.manrope(color: Generales.lightColorText, fontWeight: FontWeight.bold),
                ),
            const SizedBox(height: 15),
            TextFormField(
              style: GoogleFonts.manrope(color: Generales.lightColorText),
              decoration: Generales.ipdec(labelText: 'Email', hintText: 'Ingresa tu correo para suscribirte'),
            ),

          ],
        ),
      ),
      actions: [
        
        SizedBox(
          
          child: NormalButton(
              text: 'Cerrar',
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        SizedBox(
          
          child: ActionButton(
              text: 'Suscribir',
              onPressed: () {
                print('Suscrito');
                Navigator.of(context).pop();
              }),
        ),
      ],
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => alertDialog,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          child: const Text(
            'Suscribir',
            style: TextStyle(color: Color(0XFF55368C), fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
