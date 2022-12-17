import 'package:flutter/material.dart';

import '../model/news.dart';
import '../utility/configration.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
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
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Colors.black26,
                    ),
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
