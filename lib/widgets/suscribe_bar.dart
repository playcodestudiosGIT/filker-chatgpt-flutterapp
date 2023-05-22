import 'package:fliker/widgets/botones/suscribe_button.dart';
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Comunidad de FILKERS',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 15),
          SuscribeButton()
        ],
      ),
    );
  }
}
