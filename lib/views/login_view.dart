import 'package:fliker/widgets/botones/login_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/generales.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // final sizeScreen = MediaQuery.of(context).size;
    return ListView(children: [
      const SizedBox(height: 60),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100),
              child: AspectRatio(
                  aspectRatio: 32 / 9,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0, left: 0, right: 10),
                    child: const Image(
                      image: AssetImage('images/logogrande.png'),
                      fit: BoxFit.contain,
                    ),
                  ))),
          Text('Todos tenemos algo que contar', style: GoogleFonts.manrope(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w800)),
          const SizedBox(height: 60),
          Text('LOGIN', style: GoogleFonts.manrope(fontSize: 26, color: Generales.pColor, fontWeight: FontWeight.w800)),
          const SizedBox(height: 15),
          SizedBox(
              width: 340,
              child: Form(
                child: Column(children: [
                  TextFormField(
                    decoration: Generales.ipdec('Correo'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: Generales.ipdec('Contraseña'),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Recuerdame', style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w400) ),
                      const Checkbox(value: false, onChanged: null),
                      const Spacer(),
                      LoginButton(text: 'Log in', onPressed: (){},),
                    ],
                  ),
                  const SizedBox(height: 60,),
                  Row(
                    children: [
                      const Text('Si no tienes una cuenta '),
                      Text('Registrate', style: GoogleFonts.manrope(color: Generales.pColor),)
                    ],
                  )
                ]),
              ))
        ],
      ),
    ]);
  }
}
