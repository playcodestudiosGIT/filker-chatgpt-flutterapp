import 'package:fliker/constants/generales.dart';
import 'package:fliker/providers/auth_provider.dart';
import 'package:fliker/router/router.dart';
import 'package:fliker/services/navigation_service.dart';
import 'package:fliker/widgets/botones/login_button.dart';
import 'package:fliker/widgets/botones/circle_button.dart';
import 'package:fliker/widgets/link_text.dart';
import 'package:fliker/widgets/vertical_divider_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralLayout extends StatelessWidget {
  final Widget child;
  const GeneralLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Generales.pColor.withOpacity(0.1),
      appBar: appBar(size, auth.authStatus),
      body: child,
      bottomNavigationBar: const _BottomBar(),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 5)],
          gradient: LinearGradient(colors: [
            Generales.sColor,
            Generales.pColor,
          ])),
      padding: const EdgeInsets.all(10),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: linkTextList,
      ),
    );
  }
}

List<Widget> linkTextList =  [
  const LinkText(text: 'Contacto', fontSize: 10),
  const SizedBox(width: 12),
  const LinkText(text: 'Políticas de Privacidad', fontSize: 10),
  const SizedBox(width: 12),
  const LinkText(text: 'Términos y condiciones', fontSize: 10),
  const SizedBox(width: 12),
  const LinkText(text: 'Nosotros', fontSize: 10),
  const SizedBox(width: 12),
  const LinkText(text: 'PitchDeck', fontSize: 10),
];

AppBar appBar(size, AuthStatus status) {
  return AppBar(
    elevation: 6,
    backgroundColor: const Color(0xFFF1F1F1),
    title: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => NavigatorService.navigateTo(Flurorouter.homeRoute),
        child: const Image(
          image: AssetImage('images/logo.png'),
          width: 100,
        ),
      ),
    ),
    actions: [
      // CircleButton(
      //   icon: Icons.share_outlined,
      //   onPressed: () => print('shared'),
      // ),
      const SizedBox(width: 10),
      CircleButton(
        icon: Icons.dark_mode_outlined,
        onPressed: () => print('darkmode'),
      ),
      const SizedBox(width: 10),
      const VerticalDividerAppbar(),
      const SizedBox(width: 10),
      LoginButton(text: 'Log in', onPressed: () => NavigatorService.navigateTo(Flurorouter.loginRoute)),
    ],
  );
}
