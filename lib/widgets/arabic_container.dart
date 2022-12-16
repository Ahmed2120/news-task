import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/news.dart';

class ArabicContainer extends StatelessWidget {
  const ArabicContainer({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage('https://cdn5-ss12.sharpschool.com/UserFiles/Servers/Server_1023780/Image/News.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black26,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  IconButton(
                    onPressed: (){},
                      icon: Icon(Icons.bookmark, color: news.isFavorite ? Colors.deepOrange : Colors.white,)),
                  Text('${news.publishedAt!.hour}', style: const TextStyle(color: Colors.white),),
                ],
              ),
              Text(news.title!, overflow: TextOverflow.ellipsis, maxLines: 2, style: const TextStyle(color: Colors.white, fontSize: 15),)
            ],
          ),
        ),
      ),
    );
  }
}
