import 'package:flutter/material.dart';
import 'package:galaxy_task/pages/news_details_page.dart';
import 'package:provider/provider.dart';

import '../model/news.dart';
import '../provider/favorite_provider.dart';
import '../utility/configration.dart';

class ArabicContainer extends StatelessWidget {
  const ArabicContainer({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    Duration duration = DateTime.now().difference(news.publishedAt!);
    String durationAgo = duration.inHours == 0
        ? '${duration.inMinutes} minutes ago'
        : '${duration.inHours} Hours ago';

    return InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailsPage(news: news))),
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
                    durationAgo,
                    style: const TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () =>
                          Provider.of<FavoriteProvider>(context, listen: false)
                              .changeFavorite(news),
                      icon: Icon(
                        Icons.bookmark,
                        color: news.isFavorite ? Colors.deepOrange : Colors.white,
                      )),
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
