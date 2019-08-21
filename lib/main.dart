import 'package:coviva/common/bloc/auth/auth_bloc.dart';
import 'package:coviva/common/bloc/posts/post_bloc.dart';
import 'package:coviva/common/bloc/tabs/tab.dart';
import 'package:coviva/common/colors.dart';
import 'package:coviva/common/services/post_repository.dart';
import 'package:coviva/common/services/post_services.dart';
import 'package:coviva/common/services/userRepository.dart';
import 'package:coviva/pages/homepage.dart';
import 'package:coviva/pages/postComments/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TabBloc tabBloc = TabBloc();
  final PostBloc postBloc = PostBloc(
      postRepository: PostRepository(
          postApiClient: PostApiClient(httpClient: http.Client())));
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AuthenticationBloc(userRepository: UserRepository()),
      child: _getMaterialApp(),
    );
  }

  Widget _getMaterialApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TabBloc>(
            builder: (context) => tabBloc,
          ),
          BlocProvider<PostBloc>(
            builder: (context) => postBloc,
          )
        ],
        child: HomePage(),
      ),
      theme: ThemeData(primaryColor: covivoPrimary, accentColor: covivoAccent),
      onGenerateRoute: (settings) {
        if (settings.name == CommentPage.routeName) {
          return MaterialPageRoute(builder: (context) {
            return BlocProvider.value(
                value: postBloc, child: CommentPage(post: settings.arguments));
          });
        }
      },
    );
  }
}
