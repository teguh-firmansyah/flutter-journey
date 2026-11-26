class ArticleModel {
  final int id;
  final String title;
  final String content;
  final String? imageUrl;

  ArticleModel({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      imageUrl: json['image_url'],
    );
  }
}
