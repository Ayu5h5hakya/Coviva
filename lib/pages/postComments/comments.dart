import 'package:coviva/common/bloc/posts/post_bloc.dart';
import 'package:coviva/common/bloc/posts/post_event.dart';
import 'package:coviva/common/bloc/posts/post_state.dart';
import 'package:coviva/common/colors.dart';
import 'package:coviva/common/models/post.dart';
import 'package:coviva/common/widgets/commentTile.dart';
import 'package:coviva/common/widgets/interaction.dart';
import 'package:coviva/common/widgets/postMeta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatelessWidget {
  static const routeName = '/comments';
  CommentPage({Key key, this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PostBloc>(context)
      ..dispatch(FetchComment());
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
          BlocBuilder<PostBloc, FetchState>(
            builder: (context, state) {
              if (state is PostUninitailized) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (state is PostLoaded) {
                  return CommentList();
                }
              }
            },
          )
        ],
      ),
      backgroundColor: commentsBackground,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {},
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
