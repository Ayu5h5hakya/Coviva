import 'package:coviva/common/colors.dart';
import 'package:coviva/common/models/StatMap.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PiePainter extends CustomPainter {
  List<StatMap> dataMap;
  double sumAggregate = 0.0;
  double totalSweep = 0.0;

  PiePainter({this.dataMap}){
    print(dataMap);
    dataMap.forEach((elem){
      sumAggregate+=elem.portion;
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    dataMap.forEach((elem) {
      _buildSector(canvas, size, elem.portion,elem.portionColor);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }


  num degToRad(num deg) => deg * (pi / 180.0);

  void _buildSector(Canvas canvas, Size size, int portion, Color portionColor) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 5;

    var paint2 = Paint();
    paint2.color = postsBackground;
    paint2.strokeWidth = 4;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeCap = StrokeCap.round;

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
    
    canvas.drawPath(path, paint2);
    totalSweep +=sectorSweep;
  }
}
