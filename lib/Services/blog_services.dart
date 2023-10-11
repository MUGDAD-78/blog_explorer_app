// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:blog_explorer_app/models/blog_items_model.dart';
import 'package:blog_explorer_app/models/blog_model.dart';
import 'package:http/http.dart' as http;

class BlogServices {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret =
      '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
  Future<List<BlogItems>> fetchBlogs() async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        BlogModel blogsModel = BlogModel.fromJson(jsonData);
        List<BlogItems> newListOfBlogItems =
            blogsModel.blogs.map((e) => BlogItems.fromJson(e)).toList();
        return newListOfBlogItems;
      } else {
        print('statusCode = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
    throw "";
  }
}
