import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      constraints: const BoxConstraints(maxWidth: 1200, maxHeight: 100, minHeight: 100),
      decoration: BoxDecoration(color: const Color(0xFFEFF7FD), borderRadius: BorderRadius.circular(15)),
      child: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _ItemRow(grandeText: '1m', toptext: 'Active', bottext: 'Users'),
        Padding(padding: EdgeInsets.symmetric(vertical: 35), child: VerticalDivider(width: 3, color: Colors.black12)),
        _ItemRow(
          grandeText: '10m',
          toptext: 'Files',
          bottext: 'Converted',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 35), child: VerticalDivider(width: 3, color: Colors.black12)),
        _ItemRow(
          grandeText: '200+',
          toptext: 'Online',
          bottext: 'Tools',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 35), child: VerticalDivider(width: 3, color: Colors.black12)),
        _ItemRow(
          grandeText: '500k',
          toptext: 'PDFs',
          bottext: 'Created',
        ),
      ]),
    );
  }
}

class _ItemRow extends StatelessWidget {
  final String bottext, grandeText, toptext;
  const _ItemRow({required this.bottext, required this.grandeText, required this.toptext});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            grandeText,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Color(0xFF1A8FE3)),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                toptext,
                style: GoogleFonts.poppins(color: Colors.black45, fontWeight: FontWeight.bold),
              ),
              Text(
                bottext,
                style: GoogleFonts.poppins(color: Colors.black45, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
