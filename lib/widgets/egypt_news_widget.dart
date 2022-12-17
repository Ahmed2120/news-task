import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:galaxy_task/utility/configration.dart';

import '../model/news.dart';
import '../services/api_service.dart';
import 'arabic_container.dart';

class EgyptNews extends StatefulWidget {
  const EgyptNews({
    super.key,
  });

  @override
  State<EgyptNews> createState() => _EgyptNewsState();
}

class _EgyptNewsState extends State<EgyptNews> {

  final apiService = ApiService();
  List<News> news = [];
  bool _isLodaing = false;

  getEgNews() async{
    setState(() =>_isLodaing = true);
    news = await apiService.getEgNews();
    setState(() =>_isLodaing = false);
  }

  @override
  void initState() {
    super.initState();

    getEgNews();
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context,int index){
        return ArabicContainer(news: news[index]);
      },
      itemCount: news.length,
      pagination: SwiperPagination(
          margin: EdgeInsets.zero,
          builder: SwiperCustomPagination(builder: (context, config) {
            return ConstrainedBox(
              constraints: const BoxConstraints.expand(height: 50.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                color: Colors.grey[200],
                child:  const DotSwiperPaginationBuilder(
                    color: Colors.black12,
                    activeColor: Colors.black,
                    size: 10.0,
                    activeSize: 20.0)
                    .build(context, config),
              ),
            );
          })),
      viewportFraction: 0.7,
      scale: 0.7,
      itemWidth: 300.0,
      itemHeight: 300,
      outer: true,
    );
  }
}