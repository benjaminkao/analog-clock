import 'package:flutter/material.dart';
import 'dart:math';


class SecondHandPainter extends CustomPainter {
  final Paint secondHandPaint = new Paint();
  int seconds;
  final color;
  SecondHandPainter({this.seconds, this.color}) {
    secondHandPaint.color = color;
    secondHandPaint.style = PaintingStyle.fill;
  }


  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * (seconds / 60));


    Path secondHand = new Path();

    secondHand.moveTo(-1.0, 15.0);
    secondHand.lineTo(-1.0, -radius - radius / 7);
    secondHand.lineTo(1.0, -radius - radius / 7);
    secondHand.lineTo(1.0, 15.0);
    secondHand.close();

    canvas.drawPath(secondHand, secondHandPaint);
    canvas.drawShadow(secondHand, Colors.black, 3.0, false);

    canvas.restore();

  }

  @override
  bool shouldRepaint(SecondHandPainter oldDelegate) {
    return true;
  }

}