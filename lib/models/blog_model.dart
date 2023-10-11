class BlogModel {
  List<dynamic> blogs;
  BlogModel({required this.blogs});

  factory BlogModel.fromJson(Map<String, dynamic> jsonData) {
    return BlogModel(blogs: jsonData['blogs']);
  }
}
