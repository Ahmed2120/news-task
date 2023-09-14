import 'package:flutter/material.dart';
import 'package:galaxy_task/cnsts.dart';
import 'package:provider/provider.dart';

import '../widgets/latest_news_container.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(itemBuilder: (context, index)=> ChangeNotifierProvider.value(
        value: favoriteNews[index],
          child: const LatestNewsContainer()), itemCount: favoriteNews.length,)
    ,
    );
  }
}
