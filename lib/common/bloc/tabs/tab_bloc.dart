import 'package:bloc/bloc.dart';
import 'package:coviva/common/bloc/tabs/tab_event.dart';
import 'package:coviva/common/widgets/tab_selector.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.all;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async*{
    if(event is UpdateTab){
      yield event.tab;
    }
  }

}