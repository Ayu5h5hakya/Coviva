import 'package:coviva/common/colors.dart';
import 'package:coviva/pages/postComments/comments.dart';
import 'package:coviva/pages/postlist/posts.dart';
import 'package:coviva/pages/postlist/savedposts.dart';
import 'package:coviva/pages/profile/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  int _selectedindex = 0;
  List<Widget> widgetList = <Widget>[
    PostsPage(),
    FavoritesPage(),
    ProfilePage()
  ];
  List<String> titleList = <String>[
    'All',
    'Favorite',
    'Profile'
  ];

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleList.elementAt(widget._selectedindex)),
      ),
      backgroundColor: postsBackground,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.all_inclusive), title: Text('All')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Favorite')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
        ],
        currentIndex: widget._selectedindex,
        selectedItemColor: covivoAccent,
        onTap: _onItemSelected,
      ),
      body: widget.widgetList.elementAt(widget._selectedindex),
    );
  }

  void _onItemSelected(int index){
    setState(() {
     widget._selectedindex = index; 
    });
  }
}