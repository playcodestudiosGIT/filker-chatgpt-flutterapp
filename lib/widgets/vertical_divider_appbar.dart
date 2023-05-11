import 'package:flutter/material.dart';

class VerticalDividerAppbar extends StatelessWidget {
  const VerticalDividerAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 2,
      color: Colors.black12,
    );
  }
}
