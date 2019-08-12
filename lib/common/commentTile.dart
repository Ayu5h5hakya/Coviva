import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            child: Row(
              children: <Widget>[
                Text(
                  'Commentor',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            padding: EdgeInsets.all(2.0),
          ),
          Padding(
            child: Text('Comment'),
            padding: EdgeInsets.all(2.0),
          )
        ],
      ),
    );
  }
}
