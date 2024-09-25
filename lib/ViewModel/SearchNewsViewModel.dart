import 'package:flutter/material.dart';
import 'package:news_api/Api/ApiDio.dart';

import '../Model/news.dart';
import '../View/SearchNewsPage.dart';

abstract class SearchNewsViewModel extends State<SearchNewsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final txtSearch = TextEditingController();

  final dio = Apidio();
  News? news = News(articles: [], status: "", totalResults: 0);

  void searcNews() async {
    if (txtSearch.text.isEmpty) return;

    News? result = await dio.getSearchNews(query: txtSearch.text);
    setState(() {
      news = result;
    });
  }

}
