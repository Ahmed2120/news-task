import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:galaxy_task/model/news.dart';
import 'package:http/http.dart' as http;
import '../utility/configration.dart';

class ApiService with ChangeNotifier{

  List<News> egNewsList = [];
  List<News> newsList = [];

  Future<List<News>> getEgNews() async {
    try{
      final response =
      await http.get(Uri.parse('${MyConfig.EG_NEWS}${MyConfig.API_KEY}'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final parsed = jsonResponse["articles"].cast<Map<String, dynamic>>();
        egNewsList = parsed.map<News>((json) => News.fromMap(json)).toList();

        notifyListeners();
        return egNewsList;
      } else {
        throw _handleStatusCode(response.statusCode);
      }
    }on SocketException {
      throw Exception(
          'Failed to connect to server make sure you connect to the internet');
    } on FormatException {
      throw Exception("Bad response");
    } catch (e) {
      rethrow;
    }
  }

  Future<List<News>> getLatestNews() async {
    try{
      final response = await http.get(
          Uri.parse('${MyConfig.BBC_OR_THENEXTWEB_NEWS}${MyConfig.API_KEY}'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final parsed = jsonResponse["articles"].cast<Map<String, dynamic>>();
        newsList = parsed.map<News>((json) => News.fromMap(json)).toList();

        notifyListeners();
        return newsList;
      } else {
        throw _handleStatusCode(response.statusCode);
      }
    }on SocketException {
      throw Exception(
          'Failed to connect to server make sure you connect to the internet');
    } on FormatException {
      throw Exception("Bad response");
    } catch (e) {
      rethrow;
    }
  }

  _handleStatusCode(int statusCode) {
    if (statusCode == 404) {
      throw Exception("Invalid IP Address");
    } else if (statusCode == 401) {
      throw Exception("Unauthorized");
    } else if (statusCode == 500) {
      throw Exception("Server Error");
    } else {
      throw Exception("Something does wen't wrong");
    }
  }
}