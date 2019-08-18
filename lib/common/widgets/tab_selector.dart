import 'package:coviva/common/colors.dart';
import 'package:flutter/material.dart';

enum AppTab {all,favorite, profile}

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive), title: Text('All')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorite')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
        currentIndex: AppTab.values.indexOf(activeTab),
        selectedItemColor: covivoAccent,
        onTap: (index) => onTabSelected(AppTab.values[index]),
      );
  }
}