import 'package:d_art/features/sheet/sheet.dart';
import 'package:flutter/material.dart';



class DrawPage extends StatefulWidget {
  const DrawPage({super.key});

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    return const Sheet();
  }
}
