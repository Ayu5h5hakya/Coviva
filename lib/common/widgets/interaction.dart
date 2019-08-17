import 'package:flutter/material.dart';

enum ButtonActions { upvote, downvote, favorite, comment, overflow }

class PostBottomBar extends StatelessWidget {
  final void Function(ButtonActions value) parentAction;

  PostBottomBar({Key key, this.parentAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {
              parentAction(ButtonActions.upvote);
            },
          ),
          IconButton(
            icon: Icon(Icons.thumb_down),
            onPressed: () {
              parentAction(ButtonActions.downvote);
            },
          ),
          FavoriteButton(iconCallback: parentAction),
          IconButton(
            icon: Icon(Icons.comment),
            onPressed: () {
              parentAction(ButtonActions.comment);
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              parentAction(ButtonActions.overflow);
            },
          ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {

  final void Function(ButtonActions value) iconCallback;

  FavoriteButton({Key key, this.iconCallback}) : super(key : key);
  @override
  State<StatefulWidget> createState() => FavoriteState();
}

class FavoriteState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: _isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            onPressed: () {
              _toggleFavorite();
              widget.iconCallback(ButtonActions.favorite);
            },
          );
  }

  void _toggleFavorite(){
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }
}
