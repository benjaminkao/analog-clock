import 'package:flutter/material.dart';
import 'dart:math';


class MinuteHandPainter extends CustomPainter {
  final Paint minuteHandPaint = Paint();
  int minutes;
  int seconds;
  final color;

  MinuteHandPainter({this.minutes, this.seconds, this.color}) {
    minuteHandPaint.color = color;
    minuteHandPaint.style = PaintingStyle.fill;
  }


  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;

    canvas.save();

    //Center canvas
    canvas.translate(radius, radius);

    //Rotate canvas
    canvas.rotate(2 * pi * ((this.minutes + (this.seconds / 60)) / 60));

    Path minuteHand = new Path();
    minuteHand.moveTo(-3.5, 13.0);
    minuteHand.lineTo(-3.5, - radius + radius / 10);
    minuteHand.lineTo(3.5, - radius + radius / 10);
    minuteHand.lineTo(3.5, 13.0);
    minuteHand.close();

    canvas.drawPath(minuteHand, minuteHandPaint);
    canvas.drawShadow(minuteHand, Colors.black, 4.0, false);


    canvas.restore();
  }

  @override
  bool shouldRepaint(MinuteHandPainter oldDelegate) {
    return true;
  }}