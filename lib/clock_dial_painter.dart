import 'package:flutter/material.dart';

import 'dart:math';


class ClockDialPainter extends CustomPainter {

  final romanNumeralList = ['XII','I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI'];

  final clockText;
  final color;


  final double hourTickMarkLength = 8.0;
  final double minuteTickMarkLength = 4.0;

  final double hourTickMarkWidth = 2.0;
  final double minuteTickMarkWidth = 1.0;

  final Paint tickPaint = Paint();
  final TextPainter textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.rtl,
  );
  final TextStyle textStyle = const TextStyle(
    color: Colors.grey,
    fontFamily: 'Times New Roman',
    fontSize: 12.0,
  );

  //Constructor
  ClockDialPainter({this.clockText = ClockText.roman, this.color}) {
    tickPaint.color = color;
  }



  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength;

    //Declare incremental angle which is 6 degrees since need to rotate 60 times
    final angle = 2 * pi / 60;

    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    //Draw tick marks
    for(int i = 0; i < 60; i++) {
      tickMarkLength = i % 5 == 0 ? hourTickMarkLength : minuteTickMarkLength;
      tickPaint.strokeWidth = i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;
      canvas.drawLine(
        Offset(0.0, -radius), Offset(0.0, -radius + tickMarkLength), tickPaint
      );


      //Draw the text at every quarter hour
      if(i % 15 == 0) {

        canvas.save();

        canvas.translate(0.0, -radius + 20.0);

        //Get the text from the romanNumeralList
        textPainter.text = new TextSpan(
          text: '${romanNumeralList[i~/5]}',
          style: textStyle,
        );

        //Rotatee the canvas back to 0 degrees so text is vertical
        canvas.rotate(-angle * i);

      textPainter.layout();

      textPainter.paint(canvas, Offset(-(textPainter.width / 2), -(textPainter.height / 2)));

      canvas.restore();
      }

      canvas.rotate(angle);
    }

    canvas.restore();


  }

  //Only need to paint once, so no need to repaint
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

enum ClockText{
  roman
}