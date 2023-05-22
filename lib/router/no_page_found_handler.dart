import 'package:fliker/providers/sidemenu_provider.dart';
import 'package:fliker/views/no_pahe_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandler {
  static Handler noPageFound404 = Handler(
    handlerFunc: (context, parameters) {
      Provider.of<SideMenuProvider>(context!, listen: false).setCurrentPage('');
      return const PageNotFoundScreen();
    },
  );
}
