import 'package:blog_explorer_app/Services/blog_services.dart';
import 'package:flutter/material.dart';

class ViewModelBlogs extends ChangeNotifier {
  List blogsList = [];
  fetchData() async {
    blogsList = await BlogServices().fetchBlogs();
    notifyListeners();
  }
}
