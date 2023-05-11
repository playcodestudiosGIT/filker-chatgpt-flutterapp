import 'package:flutter/material.dart';

class SuscribeBar extends StatelessWidget {
  const SuscribeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
        Color(0xFF7565FD),
        Color(0xFF55368C),
      ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Comunidad de FILKERS',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: const Text(
              'Suscribir',
              style: TextStyle(color: Color(0XFF55368C), fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
