import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:coviva/common/models/post.dart';

class PostApiClient {
  static const baseUrl = 'http://5d5235993432e70014e6b6c1.mockapi.io';
  final http.Client httpClient;

  PostApiClient({@required this.httpClient});

  Future<PostResponse> getPost() async {
    final postsUrl = '$baseUrl/posts';
    final response = await this.httpClient.get(postsUrl);
    print(response.body);
    if (response.statusCode == 200)
      return PostResponse.fromJson(json.decode(response.body));
    else
      throw Exception('Failed to load posts');
  }
}
