
class BlogItems {
  String title;
  String imgurl;

  BlogItems({required this.title, required this.imgurl});

  factory BlogItems.fromJson(Map<String, dynamic> jsonData) {
    return BlogItems(title: jsonData['title'], imgurl: jsonData['image_url']);
  }
}
