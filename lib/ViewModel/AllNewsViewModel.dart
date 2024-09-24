import 'package:news_api/Api/ApiDio.dart';

import '../Model/news.dart';
import '../View/AllNewsPage.dart';
import 'package:flutter/material.dart';

abstract class AllNewsViewModel extends State<AllNewsPage> {
  @override
  void initState() {
    super.initState();
    getAllNews(page: 1);
  }

  int page = 1;
  final dio = Apidio();
  News? news = News(articles: [], status: "", totalResults: 0);

  void getAllNews({required int page}) async {
    var getNews = await dio.getEveryThing(page: page);
    setState(() {
      news = getNews;
    });

  }

  void nextPage() {
    getAllNews(page: page + 1);
    setState(() {
      page++;
    });
  }

  void backPage() {
    if (page != 1) {
      getAllNews(page: page - 1);
      setState(() {
        page--;
      });
    }
  }
}
