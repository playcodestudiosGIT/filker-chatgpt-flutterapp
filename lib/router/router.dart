import 'package:fliker/router/dashboard_handlers.dart';
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
  static String proyectosRoute = '/dashboard/projects';
  static String scriptRoute = '/dashboard/script';
  static String myAccRoute = '/dashboard/myacc';

  static void configureRoutes() {
    //authRoutes
    router.define(rootRoute, handler: UserHandlers.home,  transitionType: TransitionType.none);
    router.define(homeRoute, handler: UserHandlers.home,  transitionType: TransitionType.none);
    router.define(loginRoute, handler: UserHandlers.login,  transitionType: TransitionType.none);
    router.define(registerRoute, handler: UserHandlers.register, transitionType: TransitionType.none);

    //dash
    router.define(proyectosRoute, handler: DashboardHandlers.proyectos, transitionType: TransitionType.fadeIn);
    router.define(scriptRoute, handler: DashboardHandlers.script, transitionType: TransitionType.fadeIn);
    router.define(myAccRoute, handler: DashboardHandlers.myacc, transitionType: TransitionType.fadeIn);

    //404
    router.notFoundHandler = NoPageFoundHandler.noPageFound404;
  }
}
