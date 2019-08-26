import 'package:coviva/common/widgets/pie_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatsPie extends StatelessWidget {

  final int likeCount;
  final int favoriteCount;

  StatsPie({Key key,
    @required this.likeCount,
    @required this.favoriteCount}) : super(key : key);
    
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PiePainter(dataMap : {likeCount : Colors.blue, favoriteCount : Colors.red}),
      child: Center(
        child: Text(''),
      ),
    );
  }
}