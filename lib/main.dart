import 'package:coviva/common/bloc/posts/post_bloc.dart';
import 'package:coviva/common/bloc/tabs/tab.dart';
import 'package:coviva/common/colors.dart';
import 'package:coviva/common/services/post_repository.dart';
import 'package:coviva/common/services/post_services.dart';
import 'package:coviva/pages/homepage.dart';
import 'package:coviva/pages/postComments/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final PostRepository postRepository = PostRepository(
    postApiClient: PostApiClient(
     httpClient: http.Client()
    )
  );

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
            builder: (context) => PostBloc(
              postRepository: postRepository
            ),
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