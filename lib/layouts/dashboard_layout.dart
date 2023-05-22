import 'dart:ui';

import 'package:fliker/constants/generales.dart';
import 'package:fliker/providers/auth_provider.dart';
import 'package:fliker/providers/sidemenu_provider.dart';
import 'package:fliker/router/router.dart';
import 'package:fliker/services/navigation_service.dart';
import 'package:fliker/widgets/botones/circle_button.dart';
import 'package:fliker/widgets/link_text.dart';
import 'package:fliker/widgets/sidebar.dart';
import 'package:fliker/widgets/vertical_divider_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthProvider>(context);
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    return Scaffold(
      appBar: appBar(context, size: size, status: auth.authStatus, sideMenuProvider: sideMenuProvider),
      backgroundColor: Generales.pColor.withOpacity(0.1),
      body: Stack(
        children: [
          Row(
            children: [if (size.width > 700) const Sidebar(), Expanded(child: widget.child)],
          ),
          if (size.width <= 700)
            AnimatedBuilder(
                animation: SideMenuProvider.menuController,
                builder: (context, _) => Stack(
                      children: [
                        if (sideMenuProvider.isOpen)
                          AnimatedOpacity(
                              opacity: sideMenuProvider.opacity.value,
                              duration: const Duration(microseconds: 300),
                              child: GestureDetector(
                                onTap: () => sideMenuProvider.closeMenu(),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
                                  ),
                                ),
                              )),
                        Transform.translate(
                          offset: Offset(sideMenuProvider.movement.value, 0),
                          child: const Sidebar(),
                        ),
                      ],
                    ))
        ],
      ),
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

List<Widget> linkTextList = [
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

AppBar appBar(BuildContext context, {required size, required AuthStatus status, required sideMenuProvider}) {
  return AppBar(
    leading: (size.width <= 700)
        ? (!sideMenuProvider.isOpen)
            ? IconButton(
                icon: Icon(
                  Icons.menu_outlined,
                  color: Generales.pColor,
                ),
                onPressed: () {
                  sideMenuProvider.openMenu();
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.clear_outlined,
                  color: Generales.pColor,
                ),
                onPressed: () {
                  sideMenuProvider.closeMenu();
                },
              )
        : null,
    title: (size.width >= 375)
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => NavigatorService.navigateTo(Flurorouter.homeRoute),
                child: const Image(
                  image: AssetImage('images/logo.png'),
                  width: 100,
                ),
              ),
            ),
          )
        : null,
    elevation: 6,
    backgroundColor: const Color(0xFFF1F1F1),
    actions: [
      // CircleButton(
      //     icon: Icons.share_outlined,
      //     onPressed: () {
      //       print('shared');
      //     }),
      const SizedBox(width: 10),
      CircleButton(
        icon: Icons.dark_mode_outlined,
        onPressed: () {
          print('darkmode');
        },
      ),
      const SizedBox(width: 10),
      const VerticalDividerAppbar(),
      const SizedBox(width: 10),
      CircleButton(
        icon: Icons.notifications,
        onPressed: () {
          // NavigatorService.navigateTo(Flurorouter.dashboardRoute);
        },
      ),
      const SizedBox(width: 10),
      CircleButton(
        icon: Icons.dashboard_outlined,
        onPressed: () {
          // NavigatorService.navigateTo(Flurorouter.dashboardRoute);
        },
      ),

      const SizedBox(width: 10),
      CircleButton(
        icon: FontAwesomeIcons.arrowRightFromBracket,
        onPressed: () {
          Provider.of<AuthProvider>(context, listen: false).logOut();
        },
      ),
      SizedBox(width: (size.width > 445) ? 40 : 8)
    ],
  );
}
