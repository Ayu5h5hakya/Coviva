import 'package:coviva/common/widgets/pie_painter.dart';
import 'package:flutter/widgets.dart';

class StatsPie extends StatelessWidget {

  final int likeCount;
  final int favoriteCount;

  StatsPie({Key key,
    @required this.likeCount,
    @required this.favoriteCount}) : super(key : key)

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
      painter: PiePainter(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('test'),
            Text('test'),
            Text('test')
          ],
        ),
      ),
    );
  }
}