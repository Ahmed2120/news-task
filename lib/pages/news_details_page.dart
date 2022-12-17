import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/news.dart';
import '../utility/configration.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context, listen: false);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
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
      body: Column(
        children: [
          Expanded(
            flex: 3,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(news.imageUrl == null
                              ? MyConfig.DEFAULT_IMAGE
                              : news.imageUrl!),
                          fit: BoxFit.cover)),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Colors.black26,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                        child: Text(news.getDuration, style: TextStyle(color: Colors.white),)),
                  ))),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(left: BorderSide(color: Colors.deepOrange, width: 3))
              ),
                child: Text(news.title!, style: const TextStyle(fontSize: 20),)),
          ),
          Expanded(flex: 4, child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(news.description == null ? '' : news.description!, style: const TextStyle(fontSize: 20)),
          )),
        ],
      ),
    );
  }
}
