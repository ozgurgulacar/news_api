import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_api/Util/constants.dart';

import '../Model/news.dart';

class Apidio {

  final dio = Dio(BaseOptions(baseUrl: "https://newsapi.org/v2"));

  Future<News?> getEveryThing({required int page}) async {
    final response = await dio.get(
        "/everything?q=\"default\"&apiKey=${Constants().apiKey}&page=$page&pageSize=20");

    if (response.statusCode == HttpStatus.ok) {
      final body = response.data;
      return News.fromJson(body);
    }
    return null;
  }

  Future<News?> getTopHeadlines() async {
    final response =
        await dio.get("/top-headlines?country=us&apiKey=${Constants().apiKey}");

    if (response.statusCode == HttpStatus.ok) {
      final body = response.data;
      return News.fromJson(body);
    }
    return null;
  }

  Future<News?> getSearchNews({required int page,required String query}) async {
    final response = await dio.get(
        "/everything?q=\"$query\"&apiKey=${Constants().apiKey}&page=$page&pageSize=20");

    if (response.statusCode == HttpStatus.ok) {
      final body = response.data;
      return News.fromJson(body);
    }
    return null;
  }


}
