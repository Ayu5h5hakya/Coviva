import 'package:equatable/equatable.dart';

class PostResponse{
  final List<Post> posts;

  PostResponse({this.posts});

  factory PostResponse.fromJson(List<dynamic> parsedJson){
    List<Post> postList = new List<Post>();
    postList = parsedJson.map((i)=> Post.fromJson(i)).toList();
    return new PostResponse(posts: postList);
  }

}

class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String imageUrl;
  final String uploaderName;
  final String uploadTime;
  final int likeCount;
  final int commentCount;

  Post({this.userId, this.id, this.title, this.imageUrl, this.uploaderName, this.uploadTime, this.likeCount,this.commentCount});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
      uploaderName: json['uploader_name'],
      uploadTime: json['upload_time'],
      likeCount: json['like_count'],
      commentCount: json['comment_count']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId' : userId,
      'title': title,
      'image_url': imageUrl,
      'uploader_name':uploaderName,
      'upload_time':uploadTime,
      'like_count':likeCount,
      'comment_count':commentCount
    };
  }

  @override
  String toString() => 'Post{id : $id}';
}