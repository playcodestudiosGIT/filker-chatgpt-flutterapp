import 'package:fliker/constants/generales.dart';
import 'package:fliker/providers/chat_provider.dart';
import 'package:fliker/widgets/botones/action_button.dart';
import 'package:fliker/widgets/botones/login_button.dart';
import 'package:fliker/widgets/cards/card_wheel_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArgumentoTest extends StatefulWidget {
  const ArgumentoTest({super.key});

  @override
  State<ArgumentoTest> createState() => _ArgumentoTestState();
}

class _ArgumentoTestState extends State<ArgumentoTest> {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Genera rapidamente una sinopsis de tu historia.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(color: const Color(0XFFA3A3A3), fontSize: 20, fontWeight: FontWeight.w300),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 800,
            maxHeight: (chatProvider.indexArgumentGenerator == 0) ? 220 : 600,
          ),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: chatProvider.pageController,
            onPageChanged: (value) => chatProvider.indexArgumentGenerator == value,
            scrollDirection: Axis.horizontal,
            children: [
              const _Argumento(),
              _Response(),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          'Explora',
          style: GoogleFonts.manrope(fontSize: 38, color: Colors.black87, fontWeight: FontWeight.w100),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          constraints: const BoxConstraints(minWidth: 400, minHeight: 450, maxHeight: 450),
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: const [
              SizedBox(
                width: 350,
                child: CardHome(
                    title: 'THE WINNER BEAR',
                    sinopsis: 'Erase una vez un oso que no podía surfear, gano la competenicia!',
                    generoDuracion: 'INFANTIL - 5 MIN',
                    nombre: 'Andry T.',
                    baner: AssetImage('/images/foto2.png'),
                    profile: AssetImage('/images/avatar.png'),
                    ausp: AssetImage('/images/toys.png')),
              ),
              SizedBox(
                width: 350,
                child: CardHome(
                    title: 'POR UNAS LATAS',
                    sinopsis: 'Esta espumante historia se sale de control cuando inesperadamente estan envueltos en latozas situaciones!',
                    generoDuracion: 'INFANTIL - 5 MIN',
                    nombre: 'Johny E.',
                    baner: AssetImage('/images/foto1.png'),
                    profile: AssetImage('/images/avatar.png'),
                    ausp: AssetImage('/images/cocacola.png')),
              ),
              SizedBox(
                width: 350,
                child: CardHome(
                    title: 'EN TUS ZAPATOS',
                    sinopsis: 'Todo sacrificio tiene su recompensa, ahora Mick tiene que ganarse su lugar!',
                    generoDuracion: 'INFANTIL - 5 MIN',
                    nombre: 'Samuel L.',
                    baner: AssetImage('/images/foto3.png'),
                    profile: AssetImage('/images/avatar.png'),
                    ausp: AssetImage('/images/reebook.png')),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Response extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0XFFF9F9F9), borderRadius: BorderRadius.circular(35)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Text(
                  chatProvider.response,
                  style: GoogleFonts.mulish(color: Generales.lightColorText, fontSize: 16),
                ),
              ),
            ),
          ),
          Text(
            'Esta es una muestra de lo fácil y rápido que puedes evolucionar tu historia para llevarla a producción',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Generales.pColor.withOpacity(0.3), fontSize: 14, fontWeight: FontWeight.w300),
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  chatProvider.like = !chatProvider.like;
                },
                icon: const Icon(Icons.thumb_up),
                color: (chatProvider.like) ? Generales.pColor : Generales.pColor.withOpacity(0.3),
              ),
              IconButton(
                onPressed: () {
                  chatProvider.addlike = !chatProvider.addlike;
                },
                icon: const Icon(Icons.star),
                color: (chatProvider.addlike) ? Colors.amber : Generales.pColor.withOpacity(0.3),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Provider.of<ChatProvider>(context, listen: false).pageController.jumpToPage(0);
                  Provider.of<ChatProvider>(context, listen: false).indexArgumentGenerator = 0;
                },
                icon: Center(
                  child: Icon(
                    Icons.restart_alt,
                    size: 25,
                    color: Generales.pColor.withOpacity(0.3),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              LoginButton(
                text: 'Registrar',
                onPressed: () {}, // Ir a lista de espera
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}

class _Argumento extends StatefulWidget {
  const _Argumento();

  @override
  State<_Argumento> createState() => _ArgumentoState();
}

class _ArgumentoState extends State<_Argumento> {
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Container(
      alignment: Alignment.center,
      // padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      // width: 800,

      decoration: BoxDecoration(color: const Color(0XFFF9F9F9), borderRadius: BorderRadius.circular(35)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: TextFormField(
                // initialValue: chatProvider.message,
                style: const TextStyle(color: Colors.black54),
                maxLines: 4,
                decoration: Generales.ipdec(
                    sufIcon: IconButton(
                        onPressed: () {
                          chatProvider.controller.clear();
                        },
                        icon: Icon(
                          Icons.restart_alt_outlined,
                          color: Generales.pColor.withOpacity(0.3),
                        )),
                    labelText: 'Sobre que quieres generar tu sinopsis.',
                    hintText:
                        'Escribe aquí lo que quieres contar, puedes incluir lugares, nombres o darme algunos detalles que yo generaré una sinopsis de tu historia.'),
                controller: chatProvider.controller,
                onChanged: (value) {
                  Provider.of<ChatProvider>(context, listen: false).message = value;
                }),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                DecoratedBox(
                  decoration: Generales.myCustomShapeDec(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: 125,
                    height: 35,
                    child: DropdownButton(
                      icon: Icon(Icons.arrow_drop_down, color: Generales.pColor),
                      isExpanded: true,
                      style: GoogleFonts.mulish(color: Generales.pColor),
                      underline: Container(),
                      value: chatProvider.genero,
                      items: const [
                        DropdownMenuItem(value: 'Ficcion', child: Text('Ficción')),
                        DropdownMenuItem(value: 'Drama', child: Text('Drama')),
                        DropdownMenuItem(value: 'Comedia', child: Text('Comedia')),
                        DropdownMenuItem(value: 'Terror', child: Text('Terror')),
                        DropdownMenuItem(value: 'Romance', child: Text('Romance')),
                        DropdownMenuItem(value: 'Infantil', child: Text('Infantil')),
                      ],
                      onChanged: (newValue) {
                        Provider.of<ChatProvider>(context, listen: false).genero = newValue.toString();
                      },
                    ),
                  ),
                ),
                const Spacer(),
                !chatProvider.isLoading
                    ? ActionButton(text: 'Generar', onPressed: chatProvider.sendReqAsync) // chatProvider.sendReqAsync
                    : const Center(child: SizedBox(width: 35, height: 35, child: CircularProgressIndicator()))
              ],
            ),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }
}

class BotonAzul extends StatelessWidget {
  final bool principal;
  final String text;
  const BotonAzul({super.key, required this.text, required this.principal});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 110,
      height: 45,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: (principal) ? Generales.pColor : Generales.pColor.withOpacity(0.6)),
      child: Text(
        text,
        style: GoogleFonts.mulish(color: Colors.white),
      ),
    );
  }
}
