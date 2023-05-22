import 'package:fliker/constants/generales.dart';
import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Generales.pColor.withOpacity(0.1),
      body: Center(child: Stack(
        
        children: [
          const Positioned(
            top: 10,
            left: 10,
            child: Image(image: AssetImage('images/isologo.png'), width: 40)),
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(color: Generales.pColor, strokeWidth: 5, )),
          
        ],
      ),),
    );
  }
}