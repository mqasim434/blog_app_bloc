import 'dart:convert';

import 'package:blog_explorer/data/models/BlogModel.dart';
import 'package:blog_explorer/core/constants/blogs_api_consts.dart';

import 'package:http/http.dart' as http;

class BlogsRepository {
  Future<List<BlogModel>> fetchBlogs() async {
    try {
      var response =
          await http.get(Uri.parse(BlogsApiConsts.endPoint), headers: {
        'x-hasura-admin-secret': BlogsApiConsts.adminSecret,
      });
      print('Response: ${response.body}');
      Map<String, dynamic> blogsJson = jsonDecode(response.body);

      var blogsList = blogsJson['blogs'];

      print(blogsList);
      print(blogsList.map((e) => BlogModel.fromJson(e)).toList());
      return blogsList.map((e) => BlogModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
