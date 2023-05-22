import 'package:fliker/providers/auth_provider.dart';
import 'package:fliker/providers/sidemenu_provider.dart';
import 'package:fliker/router/router.dart';
import 'package:fliker/widgets/link_text.dart';
import 'package:fliker/widgets/menu_item.dart';
import 'package:fliker/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/generales.dart';
import '../services/navigation_service.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    final lastname = authProvider.user!.apellido.split("").first.toUpperCase();
    
    return Container(
      margin: const EdgeInsets.all(10),
      width: 240,
      height: double.infinity,
      decoration: _sidebarBoxDec(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          // const Logo(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Generales.pColor,
              ),
              width: double.infinity,
              height: 55,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(authProvider.user!.img),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 2,
                    height: 40,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${authProvider.user!.nombre} $lastname.',
                    style: GoogleFonts.manrope(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => NavigatorService.navigateTo(Flurorouter.myAccRoute),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.user,
                          color: Colors.white.withOpacity(0.5),
                          size: 14,
                        ),
                        const SizedBox(width: 5),
                        LinkText(
                          text: 'Mi Cuenta',
                          fontSize: 12,
                          colorText: Colors.white.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      authProvider.logOut();
                    },
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.arrowRightFromBracket,
                          color: Colors.white.withOpacity(0.5),
                          size: 14,
                        ),
                        const SizedBox(width: 5),
                        LinkText(
                          text: 'Log Out',
                          fontSize: 12,
                          colorText: Colors.white.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Mi Tablero', icon: FontAwesomeIcons.gauge),
          MenuItem(
              text: 'Mis Proyectos',
              icon: Icons.file_copy_sharp,
              isActive: sideMenuProvider.currentPage == Flurorouter.proyectosRoute,
              onPressed: () {
                NavigatorService.navigateTo(Flurorouter.proyectosRoute);
                sideMenuProvider.closeMenu();
              }),
          const SizedBox(height: 10),
          MenuItem(
            text: 'Guiones Literarios',
            icon: Icons.text_fields,
            isActive: sideMenuProvider.currentPage == Flurorouter.scriptRoute,
            onPressed: () {
              NavigatorService.navigateTo(Flurorouter.scriptRoute);
              sideMenuProvider.closeMenu();
            },
          ),
          const SizedBox(height: 10),
          MenuItem(
            text: 'History Boards',
            icon: Icons.developer_board,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('history Board');
            },
          ),
          const SizedBox(height: 10),
          MenuItem(
            text: 'Guiones Técnicos',
            icon: Icons.design_services_rounded,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('Tecnicos');
            },
          ),
          const SizedBox(height: 10),
          MenuItem(
            text: 'Desgloce de Prod.',
            icon: Icons.account_tree_sharp,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('Desglose');
            },
          ),
          const SizedBox(height: 10),
          MenuItem(
            text: 'Presupuesto',
            icon: FontAwesomeIcons.moneyBill1,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('Presupuesto');
            },
          ),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Herramientas', icon: FontAwesomeIcons.screwdriverWrench),
          MenuItem(
            text: 'Sinopsis',
            icon: Icons.add_circle,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('Sinopsis');
            },
          ),
          const SizedBox(height: 10),
          MenuItem(
            text: 'Generar Actos',
            icon: Icons.add_circle,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('Actos');
            },
          ),
          const SizedBox(height: 10),
          MenuItem(
            text: 'Añadir Personajes',
            icon: Icons.add_circle,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('Personajes');
            },
          ),
          const SizedBox(height: 10),
          MenuItem(
            text: 'Añadir Locación',
            icon: Icons.add_circle,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('Locacion');
            },
          ),
          const SizedBox(height: 10),
          MenuItem(
            text: 'Incluir Acción',
            icon: Icons.add_circle,
            isActive: false,
            onPressed: () {
              sideMenuProvider.closeMenu();
              print('Accion');
            },
          ),
        ],
      ),
    );
  }

  BoxDecoration _sidebarBoxDec() {
    return BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
        gradient: LinearGradient(colors: [
          Generales.pColor,
          Generales.sColor,
        ], begin: Alignment.bottomRight, end: Alignment.topLeft),
        borderRadius: BorderRadius.circular(25));
  }
}
