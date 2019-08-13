import 'package:coviva/common/colors.dart';
import 'package:coviva/common/services/post_services.dart';
import 'package:coviva/common/widgets/interaction.dart';
import 'package:coviva/common/models/post.dart';
import 'package:coviva/common/widgets/postMeta.dart';
import 'package:flutter/material.dart';
import 'package:coviva/pages/postComments/comments.dart';

class PostsPage extends StatelessWidget {

  PostsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostResponse>(
        future: getPost(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasError){
              return Text('Error');
            } else {
              return PostList(posts: snapshot.data);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
  }
}

class PostList extends StatefulWidget {
  static const routeName = '/';
  final PostResponse posts;

  PostList({Key key, this.posts}) : super(key : key);
  
  @override
  PostState createState() => PostState();
}

class PostState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildPostCard(context, widget.posts.posts[index]);
      },
    );
  }

  Widget _buildPostCard(BuildContext context, Post post) {
    return new GestureDetector(
      onTap: (){ _gotoComments(context, post);},
      child : new Container(
      margin: const EdgeInsets.all(5.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PostMeta(post : post),
          Image.network(post.imageUrl),
          PostBottomBar()
        ],
      ),
    )
    );
  }

  _gotoComments(BuildContext context, Post post) async{
    await Navigator.pushNamed(context, CommentPage.routeName, arguments: post);
  }
}
