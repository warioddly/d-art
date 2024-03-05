import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  const DrawPage({super.key});

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {

  var mousePosition = Offset.zero;
  var path = Path();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        print('Mouse entered');
      },
      onExit: (event) {
        print('Mouse exited');
      },
      onHover: (event) {
        path.lineTo(event.localPosition.dx, event.localPosition.dy);
        mousePosition = event.localPosition;
        setState(() {});
      },
      child: CustomPaint(
        painter: DrawPainter(path, mousePosition),
        child: Container(),
      ),
    );
  }
}

class DrawPainter extends CustomPainter {

  final Path path;
  final Offset mousePosition;
  final p = Paint()
    ..color = Colors.black
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;

  DrawPainter(this.path, this.mousePosition);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, p);
    canvas.drawCircle(mousePosition, 4, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}