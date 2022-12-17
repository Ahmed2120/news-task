import 'package:flutter/material.dart';

import '../model/news.dart';
import '../pages/news_details_page.dart';
import '../utility/configration.dart';

class LatestNewsContainer extends StatelessWidget {
  const LatestNewsContainer({Key? key, required this.news}) : super(key: key);

  final News news;

  final double mainHeight = 180;
  final double secondaryHeight = 160;

  @override
  Widget build(BuildContext context) {
    Duration duration = DateTime.now().difference(news.publishedAt!);
    String durationAgo = duration.inHours == 0
        ? '${duration.inMinutes} minutes ago'
        : '${duration.inHours} Hours ago';

    return InkWell(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsDetailsPage(news: news))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          height: mainHeight,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                height: mainHeight - 20,
                margin: const EdgeInsets.only(left: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(15))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          news.imageUrl == null
                              ? MyConfig.DEFAULT_IMAGE
                              : news.imageUrl!,
                          width: secondaryHeight,
                          height: secondaryHeight,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            news.title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  durationAgo),
                              const Icon(Icons.bookmark),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
