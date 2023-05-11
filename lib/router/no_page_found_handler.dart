import 'package:fliker/views/no_pahe_found_view.dart';
import 'package:fluro/fluro.dart';


class NoPageFoundHandler {

  static Handler noPageFound404 = Handler(
    handlerFunc: (context, parameters) {
      return const PageNotFoundScreen();
    },
  );

}