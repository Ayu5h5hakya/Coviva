import 'package:coviva/common/bloc/post_bloc.dart';
import 'package:coviva/common/bloc/post_event.dart';
import 'package:coviva/common/bloc/post_state.dart';
import 'package:coviva/common/widgets/interaction.dart';
import 'package:coviva/common/models/post.dart';
import 'package:coviva/common/widgets/postMeta.dart';
import 'package:flutter/material.dart';
import 'package:coviva/pages/postComments/comments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      builder: (context) => PostBloc()..dispatch(Fetch()),
      child: PostList(),
    );
  }
}

class PostList extends StatefulWidget {
  static const routeName = '/';
  final PostResponse posts;

  PostList({Key key, this.posts}) : super(key: key);

  @override
  PostState createState() => PostState();
}

class PostState extends State<PostList> {
  PostBloc _postBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postBloc = BlocProvider.of<PostBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc,FetchState>(
      builder: (context, state) {
        if (state is PostUninitailized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is PostLoaded) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildPostCard(context, state.posts[index]);
              },
            );
          }
        }
      },
    );
  }

  Widget _buildPostCard(BuildContext context, Post post) {
    return new GestureDetector(
        onTap: () {
          _gotoComments(context, post);
        },
        child: new Container(
          margin: const EdgeInsets.all(5.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PostMeta(post: post),
              Image.network(post.imageUrl),
              PostBottomBar()
            ],
          ),
        ));
  }

  _gotoComments(BuildContext context, Post post) async {
    await Navigator.pushNamed(context, CommentPage.routeName, arguments: post);
  }
}
