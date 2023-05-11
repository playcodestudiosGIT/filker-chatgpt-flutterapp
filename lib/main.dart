import 'package:fliker/layouts/general_layout.dart';
import 'package:fliker/router/router.dart';
import 'package:fliker/providers/chat_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Filker',
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        builder: (context, child) {
          return GeneralLayout(child: child!);
        },
        scrollBehavior: MyCustomScrollBehavior(),
        // theme: ThemeData.dark(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
