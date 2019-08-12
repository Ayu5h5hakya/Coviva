import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostMeta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          child: Text(
            'Post title',
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.all(2.0),
        ),
        Padding(
          child: Row(
            children: <Widget>[
              Text(
                'Uploader name in red',
                style: TextStyle(color: Colors.redAccent),
              ),
              Text(' · '),
              Text('post source'),
              Text(' · '),
              Text('time')
            ],
          ),
          padding: EdgeInsets.all(2.0),
        ),
        Padding(
          child: Row(
            children: <Widget>[
              Text(
                'Likes',
                style: TextStyle(fontSize: 17.0),
              ),
              Text(' · '),
              Text('Comments')
            ],
          ),
          padding: EdgeInsets.all(2.0),
        )
      ],
    );
  }
}
