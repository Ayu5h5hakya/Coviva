import 'package:flutter/material.dart';
import 'dart:math';

class PiePainter extends CustomPainter {
  final Map<int, Color> dataMap;
  double sumAggregate = 0.0;
  double totalSweep = 0.0;

  PiePainter({this.dataMap}){
    dataMap.forEach((key, value){
      sumAggregate+=key;
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    dataMap.forEach((key, value) {
      _buildSector(canvas, size, key,value);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  num degToRad(num deg) => deg * (pi / 180.0);

  void _buildSector(Canvas canvas, Size size, int portion, Color portionColor) {
    var paint = Paint();
    paint.color = Colors.amber;
    paint.strokeWidth = 5;

    paint.color = portionColor;
    paint.style = PaintingStyle.fill;

    final sectorSweep = 360 * portion / sumAggregate;

    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCircle(center: center, radius: size.width / 4);
    Path path = Path()
      // set the "current point"
      ..moveTo(center.dx, center.dy)
      ..arcTo(rect, degToRad(totalSweep), degToRad(sectorSweep), false)
      ..close();
    canvas.drawPath(path, paint);
    totalSweep +=sectorSweep;
  }
}
