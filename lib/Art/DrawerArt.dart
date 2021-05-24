import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DrawerPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path_0 = Path();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_1.shader = ui.Gradient.radial(
        Offset(size.width * 0.52, size.height * 0.18),
        size.width * 1.19,
        [Color(0xff2ae7cf), Color(0xffffffff)],
        [0.00, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0799500, size.height * -0.0050000);
    path_1.lineTo(size.width * 1.1150000, size.height * -0.0050000);
    path_1.lineTo(size.width * 1.1150000, size.height * 0.2327200);
    path_1.quadraticBezierTo(size.width * 0.6782500, size.height * 0.3018800,
        size.width * 0.5327000, size.height * 0.3249400);
    path_1.quadraticBezierTo(size.width * 0.0171500, size.height * 0.3710000,
        size.width * -0.0799500, size.height * -0.0050000);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
