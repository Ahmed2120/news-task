import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../widgets/egypt_news_widget.dart';
import '../widgets/latest_news_widet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 4,child: EgyptNews(),),
          Expanded(flex: 6,child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Latest news', style: TextStyle(fontSize: 20),),
                Expanded(child: LatestNews())
              ],
            ),
          ))

        ],
      ),
    );
  }
}