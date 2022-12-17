import 'package:flutter/material.dart';
import 'package:galaxy_task/model/news.dart';

import '../cnsts.dart';

class FavoriteProvider with ChangeNotifier{
  void changeFavorite( News news) {

    if(news.isFavorite){
      news.isFavorite = false;
      favoriteNews.remove(news);
    }
    else{
      news.isFavorite = true;
      favoriteNews.add(news);
    }
    notifyListeners();
  }
}