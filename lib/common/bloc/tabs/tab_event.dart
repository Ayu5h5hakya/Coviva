import 'package:coviva/common/widgets/tab_selector.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TabEvent extends Equatable {
  TabEvent([List props = const []]) : super(props);
}

class UpdateTab extends TabEvent {
  final AppTab tab;
  UpdateTab(this.tab) : super([tab]);
  
  @override
  String toString() => 'UpdateTab {tab : $tab}';
}