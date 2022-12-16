import 'package:flutter/material.dart';

import '../model/news.dart';
import 'latest_news_container.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index)=> LatestNewsContainer(news: News(name: 'name', author: 'author', title: 'title', description: 'description', imageUrl: 'imageUrl', publishedAt: DateTime.now()),), itemCount: 3,);
  }
}
