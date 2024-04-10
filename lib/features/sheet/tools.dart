import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  const Tools({super.key});

  @override
  State<Tools> createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.redAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.copy),
            ),
            IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.paste),
            ),
          ],
        ),
      ),
    );
  }

}