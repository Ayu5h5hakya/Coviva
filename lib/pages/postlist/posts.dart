import 'package:coviva/common/bloc/posts/post_bloc.dart';
import 'package:coviva/common/bloc/posts/post_event.dart';
import 'package:coviva/common/bloc/posts/post_state.dart';
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
    final postBloc = BlocProvider.of<PostBloc>(context)..dispatch(Fetch());
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
                return _buildPostCard(context,postBloc,state.posts[index]);
              },
            );
          }
        }
      },
    );
  }

    Widget _buildPostCard(BuildContext context, PostBloc bloc, Post post) {
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
              PostBottomBar(
                parentAction: (type){
                  print(type);
                  bloc.dispatch(InsertDB(post: post));
                },
              )
            ],
          ),
        ));
  }

  _gotoComments(BuildContext context, Post post) async {
    await Navigator.pushNamed(context, CommentPage.routeName, arguments: post);
  }
}
