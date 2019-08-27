import 'package:coviva/common/models/StatMap.dart';
import 'package:coviva/common/widgets/pie_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatsPie extends StatelessWidget {

  final int likeCount;
  final int favoriteCount;
  final void Function(StatMap) onSectorClicked;

  StatsPie({Key key,
    @required this.likeCount,
    @required this.favoriteCount,
    @required this.onSectorClicked}) : super(key : key);
    
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PiePainter(
        dataMap : [
          StatMap(portion: likeCount, portionColor: Colors.red),
          StatMap(portion: favoriteCount, portionColor: Colors.blue)
        ],
        onSectorClicked: onSectorClicked),
      child: Center(
        child: Text('Nice'),
      ),
    );
  }
}