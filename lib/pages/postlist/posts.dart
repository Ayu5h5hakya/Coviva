import 'package:coviva/common/colors.dart';
import 'package:coviva/common/interaction.dart';
import 'package:coviva/common/postMeta.dart';
import 'package:flutter/material.dart';
import 'package:coviva/pages/postComments/comments.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All'),
      ),
      body: PostList(),
      backgroundColor: postsBackground,
    );
  }
}

class PostList extends StatefulWidget {
  static const routeName = '/';
  
  @override
  PostState createState() => PostState();
}

class PostState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildPostCard(context);
      },
    );
  }

  Widget _buildPostCard(BuildContext context) {
    return new GestureDetector(
      onTap: (){ _gotoComments(context);},
      child : new Container(
      margin: const EdgeInsets.all(5.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PostMeta(),
          Image.asset('assets/images/minimalism.jpg'),
          PostBottomBar()
        ],
      ),
    )
    );
  }

  _gotoComments(BuildContext context) async{
    await Navigator.pushNamed(context, CommentPage.routeName, arguments: 1);
  }
}
