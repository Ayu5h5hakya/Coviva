import 'package:flutter/material.dart';

class PostBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.thumb_up),
                Icon(Icons.thumb_down),
                Icon(Icons.favorite),
                Icon(Icons.comment),
                Icon(Icons.more_vert)
              ],
            ),
          );
  }
}