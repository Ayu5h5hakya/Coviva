import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Commentor',
            style: TextStyle(
              color: Colors.red
            ),),
          Text('Comment')  
        ],
      ),      
    );
  }
}