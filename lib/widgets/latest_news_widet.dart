import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/news.dart';
import '../services/api_service.dart';
import '../utility/CustomWidgetBuilder.dart';
import 'latest_news_container.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  final apiService = ApiService();
  List<News> news = [];
  bool _isLodaing = false;

  getLatestNews() async {
    setState(() => _isLodaing = true);
    try {
      news = await apiService.getLatestNews();
    } catch (e) {
      CustomWidgetBuilder.showMessageDialog(context, e.toString(), true);
    }
    setState(() => _isLodaing = false);
  }

  @override
  void initState() {
    super.initState();

    getLatestNews();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: news[index], child: LatestNewsContainer()),
      itemCount: news.length,
    );
  }
}
