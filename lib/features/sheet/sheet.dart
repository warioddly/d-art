import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Sheet extends StatefulWidget {
  const Sheet({super.key});

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {

  List<List<Offset>> pathState = [];
  List<List<Offset>> paths = [];
  List<Offset> path = [];

  bool isDrawing = true;
  final focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: RawKeyboardListener(
        autofocus: true,
        focusNode: focusNode,
        // onKey: onKey,
        child: GestureDetector(
          onPanUpdate: onPanUpdate,
          onPanStart: onPanStart,
          onPanEnd: onPanEnd,
          child: CustomPaint(
            painter: SheetPainter(paths),
            child: const SizedBox(),
          ),
        ),
      ),
    );
  }


  void onPanUpdate(DragUpdateDetails details) {
    print('object');
    path.add(details.localPosition);
    paths.add(path);
    updateState();
  }


  void onPanEnd(DragEndDetails details) {
    isDrawing = false;
    pathState.add(path);
    paths = pathState;
  }


  void onPanStart(DragStartDetails details) {
    isDrawing = true;
    path = [];
    path.add(details.localPosition);
  }


  void onKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent &&  event.logicalKey == LogicalKeyboardKey.keyZ && pathState.isNotEmpty) {
        pathState = pathState.sublist(0, pathState.length - 1);
        paths = pathState;
        setState(() {});
    }
  }


  void updateState() {
    if (mounted) {
      setState(() {});
    }
  }


}


class SheetPainter extends CustomPainter {

  final List<List<Offset>> path;

  SheetPainter(this.path);

  final _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {

    for (var i = 0; i < path.length; i++) {
        canvas.drawPoints(PointMode.points, path[i], _paint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

