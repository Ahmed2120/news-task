import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:galaxy_task/model/news.dart';
import 'package:http/http.dart' as http;
import '../utility/configration.dart';

class ApiService with ChangeNotifier{

  List<News> egNewsList = [];
  List<News> newsList = [];
  List<News> favoriteNewsList = [];

  Future<List<News>> getEgNews() async {
    final response =
    await http.get(Uri.parse('${MyConfig.EG_NEWS}${MyConfig.API_KEY}'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final parsed = jsonResponse["articles"].cast<Map<String, dynamic>>();
      egNewsList = parsed.map<News>((json) => News.fromMap(json)).toList();
      print(egNewsList);

      notifyListeners();
      return egNewsList;
    } else {
      throw Exception('Failed to load EgNews');
    }
  }

  Future<List<News>> getLatestNews() async {
    final response =
    await http.get(Uri.parse('${MyConfig.BBC_OR_THENEXTWEB_NEWS}${MyConfig.API_KEY}'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final parsed = jsonResponse["articles"].cast<Map<String, dynamic>>();
      newsList = parsed.map<News>((json) => News.fromMap(json)).toList();

      notifyListeners();
      return newsList;
    } else {
      throw Exception('Failed to load LatestNews');
    }
  }
}