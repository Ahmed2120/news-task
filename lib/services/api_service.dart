import 'dart:convert';

import 'package:galaxy_task/model/news.dart';
import 'package:http/http.dart' as http;
import '../utility/configration.dart';

class ApiService{

  Future<List<News>> getEgNews() async {
    final response =
    await http.get(Uri.parse('${MyConfig.EG_NEWS}${MyConfig.API_KEY}'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final parsed = jsonResponse["articles"].cast<Map<String, dynamic>>();
      return parsed.map<News>((json) => News.fromMap(json)).toList();
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
      return parsed.map<News>((json) => News.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load LatestNews');
    }
  }
}