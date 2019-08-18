import 'package:coviva/common/bloc/posts/post_event.dart';
import 'package:coviva/common/bloc/posts/post_state.dart';
import 'package:bloc/bloc.dart';
import 'package:coviva/common/services/post_services.dart';
import 'package:coviva/common/services/DBhelper.dart';

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
    } else if(event is FetchDB){
      try{
          final posts = await DatabaseHelper.instance.getPostFromDB();
          yield PostLoaded(posts: posts.posts);
      } catch(_){
        yield PostError();
      }
    } else if(event is InsertDB){
      try {
        await DatabaseHelper.instance.insert(event.post);
        yield PostLoaded(posts: (this.currentState as PostLoaded).posts);
      } catch(_){
        yield PostError();
      }
    } else if(event is Reset){
      yield PostUninitailized();
    }
  }
}

