import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
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
        Offset(size.width * 0.50, size.height * -0.15),
        size.width * 0.88,
        [Color(0xff2ae6d1), Color(0xffffffff)],
        [0.00, 1.00]);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4958333, size.height * -0.6901200);
    path_1.cubicTo(
        size.width * 0.7290000,
        size.height * -0.6621200,
        size.width * 1.0584583,
        size.height * -0.5389400,
        size.width * 1.0584583,
        size.height * -0.1500000);
    path_1.cubicTo(
        size.width * 1.0584583,
        size.height * 0.0658400,
        size.width * 0.8896250,
        size.height * 0.3901200,
        size.width * 0.4958333,
        size.height * 0.3901200);
    path_1.cubicTo(
        size.width * 0.2708125,
        size.height * 0.3901200,
        size.width * -0.0667917,
        size.height * 0.2280400,
        size.width * -0.0667917,
        size.height * -0.1500000);
    path_1.cubicTo(
        size.width * -0.0667917,
        size.height * -0.3660200,
        size.width * 0.1103750,
        size.height * -0.6621200,
        size.width * 0.4958333,
        size.height * -0.6901200);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
