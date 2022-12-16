class News{
  final String? id;
  final String? name;
  final String? author;
  final String? title;
  final String? description;
  final String? imageUrl;
  final DateTime? publishedAt;
  bool isFavorite = false;

  News(
      { this.id,
        required this.name,
        required this.author,
        required this.title,
        required this.description,
        required this.imageUrl,
        required this.publishedAt,
        this.isFavorite = false,
      });

  News.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        author = res["author"],
        title = res["title"],
        description = res["description"],
        imageUrl = res["urlToImage"],
        publishedAt = DateTime.parse(res["publishedAt"]);
}