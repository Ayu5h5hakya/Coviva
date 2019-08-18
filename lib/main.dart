import 'package:coviva/common/bloc/posts/post_bloc.dart';
import 'package:coviva/common/bloc/tabs/tab.dart';
import 'package:coviva/common/colors.dart';
import 'package:coviva/pages/homepage.dart';
import 'package:coviva/pages/postComments/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TabBloc>(
            builder: (context) => TabBloc(),
          ),
          BlocProvider<PostBloc>(
            builder: (context) => PostBloc(),
          )
        ],
        child: HomePage(),
      ),
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