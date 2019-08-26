import 'package:coviva/common/bloc/auth/auth_bloc.dart';
import 'package:coviva/common/bloc/auth/auth_state.dart';
import 'package:coviva/common/bloc/posts/post_bloc.dart';
import 'package:coviva/common/bloc/posts/post_event.dart';
import 'package:coviva/common/bloc/posts/post_state.dart';
import 'package:coviva/common/widgets/pie_chart.dart';
import 'package:coviva/pages/profile/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          final String name =
              (state as AuthenticationAuthenticated).displayName;
          return _getUserStats(context, name);
        } else
          return LoginForm();
      },
    );
  }

  Widget _getUserStats(BuildContext context, String name) {
    BlocProvider.of<PostBloc>(context)..dispatch(FetchStats());
    return BlocBuilder<PostBloc, FetchState>(
      builder: (context, state) {
        if (state is PostUninitailized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is StatsLoaded) {
          final favoritesCount = state.favoriteCount;
          final likesCount = state.likeCount;
          return StatsPie(likeCount: likesCount, favoriteCount: favoritesCount);
        }
      },
    );
  }
}
