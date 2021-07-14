import 'dart:convert';

import 'package:api/model.dart';
import 'package:http/http.dart' as http;

Future getPosts() async {
  final baseURL = "http://jsonplaceholder.typicode.com";
  var url = Uri.parse(
    '$baseURL/posts',
  );

  final response = await http.get(url);
  // print(response.statusCode);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List;
    final posts = json.map((e) => Post.fromJson(e)).toList();
    // print(response.body);
    return posts;
  }
}
