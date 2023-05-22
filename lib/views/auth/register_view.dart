import 'package:awesome_icons/awesome_icons.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fliker/providers/auth_provider.dart';
import 'package:fliker/providers/register_form_provider.dart';
import 'package:fliker/router/router.dart';
import 'package:fliker/services/navigation_service.dart';
import 'package:fliker/widgets/botones/login_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/generales.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    // final sizeScreen = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      builder: (context, child) {
        final registerFormProvider = Provider.of<RegisterFormProvider>(context);
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
              Text('Registro', style: GoogleFonts.manrope(fontSize: 26, color: Generales.pColor, fontWeight: FontWeight.w800)),
              const SizedBox(height: 15),
              SizedBox(
                  width: 340,
                  child: Form(
                    key: registerFormProvider.formKey,
                    child: Column(children: [
                      TextFormField(
                        style: GoogleFonts.manrope(color: Generales.lightColorText),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese su Nombre';
                          return null;
                        },
                        // keyboardType: TextInputType.emailAddress,
                        decoration: Generales.ipdec(
                          icon: Icon(
                            FontAwesomeIcons.user,
                            color: Generales.pColor,
                          ),
                          hintText: 'Ingrese su nombre',
                          labelText: 'Nombre',
                        ),
                        onChanged: (value) => registerFormProvider.name = value,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: GoogleFonts.manrope(color: Generales.lightColorText),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese su Apellido';
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: Generales.ipdec(
                          icon: Icon(
                            FontAwesomeIcons.idCard,
                            color: Generales.pColor,
                          ),
                          hintText: 'Ingrese su Apellido',
                          labelText: 'Apellido',
                        ),
                        onChanged: (value) => registerFormProvider.lastName = value,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: GoogleFonts.manrope(color: Generales.lightColorText),
                        validator: (value) {
                          if (!EmailValidator.validate(value.toString())) return 'Email invalido';
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: Generales.ipdec(
                          icon: Icon(
                            FontAwesomeIcons.envelope,
                            color: Generales.pColor,
                          ),
                          hintText: 'Ingrese su correo',
                          labelText: 'Email',
                        ),
                        onChanged: (value) => registerFormProvider.email = value,
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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: Generales.ipdec(
                            hintText: '********',
                            labelText: 'Contraseña',
                            icon: Icon(
                              Icons.lock_outline,
                              size: 27,
                              color: Generales.pColor,
                            )),
                        onChanged: (value) => registerFormProvider.password = value,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          LoginButton(
                            text: 'Registrar',
                            onPressed: () {
                              final validForm = registerFormProvider.validateForm(context);
                              if (!validForm) return;

                              final authProvider = Provider.of<AuthProvider>(context, listen: false)
                                .register(
                                  registerFormProvider.email,
                                  registerFormProvider.password,
                                  registerFormProvider.name,
                                  registerFormProvider.lastName
                                );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ya tienes una cuenta? ', style: GoogleFonts.manrope(color: Generales.lightColorText)),
                          const SizedBox(width: 10),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => NavigatorService.navigateTo(Flurorouter.loginRoute),
                              child: Text(
                                'Ingresar',
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
