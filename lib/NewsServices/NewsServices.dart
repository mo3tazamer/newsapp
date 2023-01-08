import 'dart:convert';

import 'package:http/http.dart'as http;


import '../models/NewsModel.dart';

class NewsServices {
  Future<List<Article>> postData() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=9e24b670ec5c4306a249c4c282852a28');
    final response =await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> body = data['articles'];

    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      print(articles[0].publishedAt);
    return articles;

  }


  Future<List<Article>> postsport() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=9e24b670ec5c4306a249c4c282852a28');
    final response =await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> body = data['articles'];

    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    print(articles[0].publishedAt);
    return articles;

  }

  Future<List<Article>> postscience() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=9e24b670ec5c4306a249c4c282852a28');
    final response =await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> body = data['articles'];

    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    print(articles[0].publishedAt);
    return articles;

  }


  Future<List<Article>> Search(var value) async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$value&apiKey=9e24b670ec5c4306a249c4c282852a28');
    final response =await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> body = data['articles'];

    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    print(articles[0].publishedAt);
    return articles;

  }










}


/*
class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Article>> getArticle() async {

    final queryParameters = {
      'country': 'us',
      'category': 'technology',
      'apiKey': 'XXXXXXXXXXXXXXXXXXXXXXXX'
    };
    final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}*/
