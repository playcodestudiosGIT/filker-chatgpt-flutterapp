import 'package:fliker/router/no_page_found_handler.dart';
import 'package:fliker/router/user_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String homeRoute = '/home';
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    //authRoutes
    router.define(rootRoute, handler: UserHandlers.root);
    router.define(homeRoute, handler: UserHandlers.home);
    router.define(loginRoute, handler: UserHandlers.login);
    // router.define(registerRoute, handler: handler);

    //dash
    // router.define(dashboardRoute, handler: handler);

    //404
    router.notFoundHandler = NoPageFoundHandler.noPageFound404;
  }
}
