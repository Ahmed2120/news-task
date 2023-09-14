import 'package:flutter/cupertino.dart';

import '../cnsts.dart';

class News with ChangeNotifier{
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

  void changeFavorite() {

    if(isFavorite){
      isFavorite = false;
      favoriteNews.remove(this);
    }
    else{
      isFavorite = true;
      favoriteNews.add(this);
    }
    notifyListeners();
  }

  String get getDuration{
    Duration duration = DateTime.now().difference(publishedAt!);
    String durationAgo = duration.inHours == 0
        ? '${duration.inMinutes} minutes ago'
        : '${duration.inHours} Hours ago';
    return durationAgo;
  }
}