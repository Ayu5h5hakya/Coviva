import 'package:coviva/common/colors.dart';
import 'package:coviva/common/commentTile.dart';
import 'package:coviva/common/interaction.dart';
import 'package:coviva/common/postMeta.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  static const routeName = '/comments';
  CommentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: CommentList(),
      backgroundColor: commentsBackground,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: (){},
      ),
    );
  }
}

class CommentList extends StatefulWidget {
  @override
  CommentState createState() => CommentState();
}

class CommentState extends State<CommentList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.add_to_photos),
            PostMeta(),
          ],
        ),
        PostBottomBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return CommentTile();
            },
          ),
        )
      ],
    );
  }
}
