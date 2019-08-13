import 'package:coviva/common/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostMeta extends StatelessWidget {
  final Post post;
  
  PostMeta({Key key, this.post}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          child: Text(
            post.title,
            style: TextStyle(fontSize: 18.0),
            maxLines: 1,
          ),
          padding: EdgeInsets.all(2.0),
        ),
        Padding(
          child: Row(
            children: <Widget>[
              Text(
                post.uploaderName,
                style: TextStyle(color: Colors.redAccent),
              ),
              Text(' · '),
              Text('i.reddit.com'),
              Text(' · '),
              Text(post.uploadTime)
            ],
          ),
          padding: EdgeInsets.all(2.0),
        ),
        Padding(
          child: Row(
            children: <Widget>[
              Text(
                _formatCountKNotation(post.likeCount),
                style: TextStyle(fontSize: 17.0),
              ),
              Text(' · '),
              Text(_formatCountKNotation(post.commentCount))
            ],
          ),
          padding: EdgeInsets.all(2.0),
        )
      ],
    );
  }

  String _formatCountKNotation(int count){
    if (count<1000) {
      return count.toString();
    } else {
      return (count/1000).toString() + "K";
    }
  }
}
