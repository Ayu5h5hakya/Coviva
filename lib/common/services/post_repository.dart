import 'package:coviva/common/models/post.dart';
import 'package:coviva/common/services/DBhelper.dart';
import 'package:coviva/common/services/post_services.dart';
import 'package:flutter/cupertino.dart';

class PostRepository {
  final PostApiClient postApiClient;
  PostRepository({@required this.postApiClient});

  Future<PostResponse> getPostListing() async => await postApiClient.getPost();

  Future<PostResponse> getSavedPostListing() async => await DatabaseHelper.instance.getPostFromDB();

  Future<void> insertPostToFavorite(Post post) async => await DatabaseHelper.instance.insert(post);
}