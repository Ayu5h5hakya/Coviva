import 'package:coviva/common/colors.dart';
import 'package:coviva/pages/homepage.dart';
import 'package:coviva/pages/postComments/comments.dart';
import 'package:flutter/material.dart';
import 'package:coviva/pages/postlist/posts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: covivoPrimary,
        accentColor: covivoAccent
      ),
      onGenerateRoute: (settings){
        if(settings.name == CommentPage.routeName){
          return MaterialPageRoute(
            builder: (context){
              return CommentPage(post : settings.arguments);
            }
          );
        }
      },
    );
  }
}