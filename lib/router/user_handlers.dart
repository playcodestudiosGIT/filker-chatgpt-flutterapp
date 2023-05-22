import 'package:fliker/views/auth/register_view.dart';
import 'package:fliker/views/home/home_view.dart';
import 'package:fliker/views/auth/login_view.dart';
import 'package:fluro/fluro.dart';


class UserHandlers {
  static Handler root = Handler(
    handlerFunc: (context, parameters) {
      return const HomeView();
    },
  );
  static Handler home = Handler(
    handlerFunc: (context, parameters) {
      return const HomeView();
    },
  );
  static Handler login = Handler(
    handlerFunc: (context, parameters) {
      return const LoginView();
    },
  );
  static Handler register = Handler(
    handlerFunc: (context, parameters) {
      return const RegisterView();
    },
  );
}
