import 'package:fliker/constants/generales.dart';
import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 35,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 2), color: const Color(0xFFF1F1F1), borderRadius: BorderRadius.circular(100)),
      child: Icon(
        Icons.share_outlined,
        size: 20,
        color: Generales.pColor,
      ),
    );
  }
}
