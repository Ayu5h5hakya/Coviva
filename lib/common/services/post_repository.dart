import 'package:coviva/common/models/UserStat.dart';
import 'package:coviva/common/models/post.dart';
import 'package:coviva/common/services/DBhelper.dart';
import 'package:coviva/common/services/post_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';

class PostRepository {
  final PostApiClient postApiClient;
  final FirebaseDatabase _database;
  final String nodeName = 'Liked';
  PostRepository({@required this.postApiClient}) : _database = FirebaseDatabase.instance;

  Future<PostResponse> getPostListing() async => await postApiClient.getPost();

  Future<PostResponse> getSavedPostListing() async => await DatabaseHelper.instance.getPostFromDB();

  Future<void> insertPostToFavorite(Post post) async => await DatabaseHelper.instance.insert(post);

  Future<void> likePost(Post post) async {
    print('like');
    _database.reference().child(nodeName).push().set(post.toMap());
  }

  Future<void> dislikePost(Post post) async {
    
  }

  Future<DataSnapshot> _getLikedPostCount() async {
    final posts = _database.reference().child(nodeName);
    return posts.once();
  }

  Future<UserStat> getStats() async {
    final favoriteObservable = Observable.fromFuture(getSavedPostListing());
    final likedObservable = Observable.fromFuture(_getLikedPostCount());

    Observable<UserStat> statObservable = favoriteObservable.zipWith<DataSnapshot, UserStat>(
      likedObservable,
      (posts, snapshot) => UserStat(likeCount: posts.posts.length,favoriteCount: snapshot.value.length)
    );

    return statObservable.first;
  }
}