import 'package:coviva/common/models/post.dart';
import 'package:equatable/equatable.dart';

abstract class FetchState extends Equatable{
  FetchState([List props = const []]) : super(props);
}

class PostUninitailized extends FetchState{
  @override
  String toString() => 'PostUninitailized';
}

class PostError extends FetchState {
  @override
  String toString() => 'PostError';
}

class PostLoaded extends FetchState {
  final List<Post> posts;
  final bool hasReachedMax;

  PostLoaded({this.posts, this.hasReachedMax}) : super([posts]);

  PostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax
  }){
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  String toString() => 'PostLoaded{posts : ${posts.length}, hasReachedMax : $hasReachedMax}';

}

class StatsLoaded extends FetchState {
  final int likeCount;
  final int favoriteCount;

  StatsLoaded({this.likeCount, this.favoriteCount}) : super([likeCount, favoriteCount]);
}