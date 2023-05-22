import 'package:email_validator/email_validator.dart';
import 'package:fliker/providers/login_form_provider.dart';
import 'package:fliker/router/router.dart';
import 'package:fliker/services/navigation_service.dart';
import 'package:fliker/widgets/botones/circle_button.dart';
import 'package:fliker/widgets/botones/login_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/generales.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // final sizeScreen = MediaQuery.of(context).size;
    //
    return ChangeNotifierProvider(
      create: (context) => LoginFormProvider(),
      builder: (context, child) {
        final loginFormProvider = Provider.of<LoginFormProvider>(context);

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
              Text('Todos tenemos algo que contar',
                  style: GoogleFonts.manrope(fontSize: 22, color: Generales.lightColorText, fontWeight: FontWeight.w800)),
              const SizedBox(height: 60),
              Text('Ingresar', style: GoogleFonts.manrope(fontSize: 26, color: Generales.pColor, fontWeight: FontWeight.w800)),
              const SizedBox(height: 15),
              SizedBox(
                  width: 340,
                  child: Form(
                    key: loginFormProvider.formKey,
                    child: Column(children: [
                      TextFormField(
                        style: GoogleFonts.manrope(color: Generales.lightColorText),
                        validator: (value) {
                          if (!EmailValidator.validate(value.toString())) return 'Email invalido';
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: Generales.ipdec(
                          icon: Icon(
                            Icons.email_outlined,
                            color: Generales.pColor,
                          ),
                          hintText: 'Ingrese su correo',
                          labelText: 'Email',
                        ),
                        onChanged: (value) => loginFormProvider.email = value,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: GoogleFonts.manrope(color: Generales.lightColorText),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese su contraseña';
                          if (value.length < 6) return 'La contraseña debe ser de 6 caracteres';
                          return null;
                        },
                        obscureText: true,
                        decoration: Generales.ipdec(
                            hintText: '********',
                            labelText: 'Contraseña',
                            icon: Icon(
                              Icons.lock_outlined,
                              color: Generales.pColor,
                            )),
                        onChanged: (value) => loginFormProvider.password = value,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Recuerdame', style: GoogleFonts.manrope(color: Generales.lightColorText)),
                          Checkbox(
                            checkColor: Colors.white,
                            fillColor: MaterialStateProperty.all(Generales.pColor),
                            value: loginFormProvider.rememberme,
                            onChanged: (value) => loginFormProvider.rememberme = !loginFormProvider.rememberme,
                          ),
                          const Spacer(),
                          LoginButton(
                            text: 'Log in',
                            onPressed: () {
                              final validForm = loginFormProvider.validateForm(context);
                              if (!validForm) return;

                              //TODO: Peticion Http Auth Provider Register
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 40, child: CircleButton(icon: FontAwesomeIcons.google, onPressed: () {})),
                          Container(width: 30, height: 2, color: Generales.lightColorText.withOpacity(0.3)),
                          SizedBox(width: 40, child: CircleButton(icon: FontAwesomeIcons.facebook, onPressed: () {})),
                          Container(width: 30, height: 2, color: Generales.lightColorText.withOpacity(0.3)),
                          SizedBox(width: 40, child: CircleButton(icon: FontAwesomeIcons.tiktok, onPressed: () {})),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No tienes una cuenta? ', style: GoogleFonts.manrope(color: Generales.lightColorText)),
                          const SizedBox(width: 10),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => NavigatorService.navigateTo(Flurorouter.registerRoute),
                              child: Text(
                                'Registrate',
                                style: GoogleFonts.manrope(color: Generales.pColor, fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
                  ))
            ],
          ),
        ]);
      },
    );
  }
}
