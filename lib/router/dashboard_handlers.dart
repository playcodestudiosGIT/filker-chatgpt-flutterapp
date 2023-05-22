import 'package:fliker/providers/auth_provider.dart';
import 'package:fliker/providers/sidemenu_provider.dart';
import 'package:fliker/router/router.dart';
import 'package:fliker/views/dashboard/my_account_view.dart';
import 'package:fliker/views/dashboard/my_projects_view.dart';
import 'package:fliker/views/auth/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/proyectos_provider.dart';
import '../views/dashboard/guiones_literarios_view.dart';

class DashboardHandlers {
  static Handler proyectos = Handler(
    handlerFunc: (context, parameters) {

      final authStatus = Provider.of<AuthProvider>(context!, listen: false).authStatus;
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.proyectosRoute);

      if (authStatus == AuthStatus.authenticated) {
        Provider.of<ProyectosProvider>(context, listen: false).obtenerProyectos(context);
        return const MisProyectosView();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler script = Handler(
    handlerFunc: (context, parameters) {

      final authStatus = Provider.of<AuthProvider>(context!, listen: false).authStatus;
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.scriptRoute);

      if (authStatus == AuthStatus.authenticated) {
        return const GuionesLiterariosView();
      } else {
        return const LoginView();
      }
    },
  );
  static Handler myacc = Handler(
    handlerFunc: (context, parameters) {

      final authStatus = Provider.of<AuthProvider>(context!, listen: false).authStatus;
      Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPage(Flurorouter.myAccRoute);

      if (authStatus == AuthStatus.authenticated) {
        return const MyAcountView();
      } else {
        return const LoginView();
      }
    },
  );
}
