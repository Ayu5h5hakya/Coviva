import 'package:coviva/common/bloc/posts/post_bloc.dart';
import 'package:coviva/common/bloc/posts/post_event.dart';
import 'package:coviva/common/bloc/tabs/tab.dart';
import 'package:coviva/common/colors.dart';
import 'package:coviva/common/services/userRepository.dart';
import 'package:coviva/common/widgets/auth_button.dart';
import 'package:coviva/common/widgets/tab_selector.dart';
import 'package:coviva/pages/postlist/posts.dart';
import 'package:coviva/pages/postlist/savedposts.dart';
import 'package:coviva/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  List<String> titleList = <String>['All', 'Favorite', 'Profile'];
    List<Widget> widgetList = <Widget>[
    PostsPage(),
    FavoritesPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
    final postBloc = BlocProvider.of<PostBloc>(context);
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(titleList.elementAt(activeTab.index)),
            actions: <Widget>[
              AuthButton(
                visible: activeTab.index != 2,
                authAction: (action){
                  tabBloc.dispatch(UpdateTab(AppTab.profile));
                })
            ],
         ),
          backgroundColor: postsBackground,
          bottomNavigationBar: TabSelector(
            activeTab: AppTab.all,
            onTabSelected: (tab){
              postBloc.dispatch(Reset());
              tabBloc.dispatch(UpdateTab(tab));
            },
          ),
          body: widgetList.elementAt(activeTab.index)
        );
      },
    );
  }
}

