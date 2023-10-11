import 'package:blog_explorer_app/models/blog_items_model.dart';
import 'package:flutter/cupertino.dart';

class FavoriteBlogs with ChangeNotifier {
  List allfavoriteblogs = [];

  addItem(BlogItems item) {
    allfavoriteblogs.add(item);
    notifyListeners();
  }

  removeItem(BlogItems item){ 
    allfavoriteblogs.remove(item);
    notifyListeners();
  }
}
