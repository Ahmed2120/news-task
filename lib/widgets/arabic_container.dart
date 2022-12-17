import 'package:flutter/material.dart';
import 'package:galaxy_task/pages/news_details_page.dart';
import 'package:provider/provider.dart';

import '../model/news.dart';
import '../utility/configration.dart';

class ArabicContainer extends StatelessWidget {
  const ArabicContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context, listen: false);

    return InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangeNotifierProvider.value(
          value: news,
          child: const NewsDetailsPage()))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(news.imageUrl == null
                    ? MyConfig.DEFAULT_IMAGE
                    : news.imageUrl!),
                fit: BoxFit.cover)),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black26,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    news.getDuration,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Consumer<News>(
                      builder: (ctx, news, _) => IconButton(
                      onPressed: () =>
                          news.changeFavorite(),
                      icon: Icon(
                        Icons.bookmark,
                        color: news.isFavorite ? Colors.deepOrange : Colors.white,
                      ))),
                ],
              ),
              Text(
                news.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textDirection: TextDirection.rtl,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
