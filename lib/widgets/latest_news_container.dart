import 'package:flutter/material.dart';

import '../model/news.dart';

class LatestNewsContainer extends StatelessWidget {
  const LatestNewsContainer({Key? key, required this.news}) : super(key: key);

  final News news;

  final double mainHeight = 180;
  final double secondaryHeight = 160;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))
              ),
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
                      child: Image.network('https://cdn5-ss12.sharpschool.com/UserFiles/Servers/Server_1023780/Image/News.jpg'
                        , width: secondaryHeight, height: secondaryHeight, fit: BoxFit.fill,),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(news.title!, overflow: TextOverflow.ellipsis, maxLines: 2, style: const TextStyle(fontSize: 20),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${news.publishedAt!.day}/${news.publishedAt!.month}/${news.publishedAt!.year}'),
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
    );
  }
}
