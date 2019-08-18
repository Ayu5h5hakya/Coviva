import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:coviva/common/models/post.dart';

String url = 'https://jsonplaceholder.typicode.com/posts?_limit=5';
String testurl = 'http://5d5235993432e70014e6b6c1.mockapi.io/posts';
String testcommentsurl = 'http://5d5235993432e70014e6b6c1.mockapi.io/comments/1';

Future<PostResponse> getPost() async {
  final response = await http.get(testurl);
  print(response.body);
  if(response.statusCode == 200) return PostResponse.fromJson(json.decode(response.body));
  else throw Exception('Failed to load post');
}