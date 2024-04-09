import 'package:flutter/material.dart';

class Sheet extends StatefulWidget {
  const Sheet({super.key});

  @override
  State<Sheet> createState() => _SheetState();
}


class _SheetState extends State<Sheet> {

  var mousePosition = Offset.zero;
  List<Offset> path = [];
  bool isDrawing = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: (details) {
        print(path);
      },
      onTapDown: (details) {
        isDrawing = false;
      },
      onPanUpdate: (details) {
          setState(() => path.add(details.localPosition));
      },
      child: CustomPaint(
        painter: SheetPainter(path),
        child: const SizedBox(),
      ),
    );
  }
}


class SheetPainter extends CustomPainter {

  final List<Offset> path;

  SheetPainter(this.path);

  final _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < path.length - 1; i++) {
      canvas.drawLine(path[i], path[i + 1], _paint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

