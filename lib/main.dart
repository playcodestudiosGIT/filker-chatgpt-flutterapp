import 'package:fliker/api/filker_api.dart';
import 'package:fliker/layouts/dashboard_layout.dart';
import 'package:fliker/layouts/general_layout.dart';
import 'package:fliker/providers/sidemenu_provider.dart';
import 'package:fliker/router/router.dart';
import 'package:fliker/providers/chat_provider.dart';
import 'package:fliker/layouts/splash_layout.dart';
import 'package:fliker/services/notifications_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'providers/proyectos_provider.dart';
import 'services/local_storage.dart';
import 'services/navigation_service.dart';

void main() async {
  await LocalStorage.configurePrefs();
  FilkerApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        
        ChangeNotifierProvider(create: (context) => SideMenuProvider()),
        ChangeNotifierProvider(create: (context) => ProyectosProvider()),
        ChangeNotifierProvider(lazy: false, create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Filker',
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigatorService.navigatorKey,
        scaffoldMessengerKey: NotificationsServices.messengerKey,
        builder: (context, child) {
          final authProvider = Provider.of<AuthProvider>(context);
          if (authProvider.authStatus == AuthStatus.checking) {
            return const SplashLayout();
          }
          if (authProvider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
          } else {
            return GeneralLayout(child: child!);
          }
        },
        scrollBehavior: MyCustomScrollBehavior(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
