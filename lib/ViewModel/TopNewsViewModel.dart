import 'package:flutter/material.dart';
import '../Api/ApiDio.dart';
import '../Model/news.dart';
import '../View/TopNewsPage.dart';


abstract class TopNewsViewModel extends State<TopNewsPage> {

  @override
  void initState() {
    super.initState();
    getTopNews();
  }


  final dio = Apidio();
  News? news = News(articles: [], status: "", totalResults: 0);

  void getTopNews() async {
    var getNews = await dio.getTopHeadlines();
    setState(() {
      news = getNews;
    });

    print(news!.totalResults);

  }

}