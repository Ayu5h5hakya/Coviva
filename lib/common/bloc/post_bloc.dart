import 'package:coviva/common/bloc/post_event.dart';
import 'package:coviva/common/bloc/post_state.dart';
import 'package:bloc/bloc.dart';
import 'package:coviva/common/services/post_services.dart';

class PostBloc extends Bloc<FetchEvent, FetchState>{

  @override
  FetchState get initialState => PostUninitailized();

  @override
  Stream<FetchState> mapEventToState(FetchEvent event) async*{
    if(event is Fetch){
      try{
        if(currentState is PostUninitailized){
          final posts = await getPost();
          yield PostLoaded(posts: posts.posts);
        }
      } catch(_){
        yield PostError();
      }
    }
  }
}