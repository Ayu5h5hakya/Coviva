import 'package:coviva/common/colors.dart';
import 'package:coviva/common/models/post.dart';
import 'package:coviva/common/services/post_services.dart';
import 'package:coviva/common/widgets/commentTile.dart';
import 'package:coviva/common/widgets/interaction.dart';
import 'package:coviva/common/widgets/postMeta.dart';
import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  static const routeName = '/comments';
  CommentPage({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Column(
        children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.add_to_photos),
            PostMeta(post: post),
          ],
        ),
        PostBottomBar(),
        FutureBuilder<PostResponse>(
          future: getPost(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error');
              } else {
                return CommentList();
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
        ],
      ),
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
    return Expanded(
           child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return CommentTile();
            },
          ),
        );
  }
}
