import 'package:coviva/common/bloc/posts/post_event.dart';
import 'package:coviva/common/bloc/posts/post_state.dart';
import 'package:bloc/bloc.dart';
import 'package:coviva/common/services/post_repository.dart';
import 'package:flutter/cupertino.dart';

class PostBloc extends Bloc<FetchEvent, FetchState> {
  final PostRepository postRepository;

  PostBloc({@required this.postRepository});

  @override
  FetchState get initialState => PostUninitailized();

  @override
  Stream<FetchState> mapEventToState(FetchEvent event) async* {
    if (event is Fetch) {
      try {
        if (currentState is PostUninitailized) {
          final posts = await postRepository.getPostListing();
          yield PostLoaded(posts: posts.posts);
        }
      } catch (_) {
        yield PostError();
      }
    } else if (event is FetchDB) {
      try {
        final posts = await postRepository.getSavedPostListing();
        yield PostLoaded(posts: posts.posts);
      } catch (_) {
        yield PostError();
      }
    } else if (event is InsertDB) {
      try {
        await postRepository.insertPostToFavorite(event.post);
        yield PostLoaded(posts: (this.currentState as PostLoaded).posts);
      } catch (_) {
        yield PostError();
      }
    } else if (event is FetchComment) {
      try {
          yield PostUninitailized();
          final posts = await postRepository.getPostListing();
          yield PostLoaded(posts: posts.posts);
      } catch (_) {
        yield PostError();
      }
    } else if (event is Reset) {
      yield PostUninitailized();
    }
  }
}
