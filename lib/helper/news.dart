import 'dart:convert';
import 'package:flutter_app_test/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async{

    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=767d83e785db4de5ad0b10e78f4174d0";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            author: element['author'],
            content: element['content'],
            urlToImage: element['urlToImage']
          );

          news.add(articleModel);

        }
      });
    }

  }


}

class CategoryNewsClass {

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{

    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=767d83e785db4de5ad0b10e78f4174d0";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              author: element['author'],
              content: element['content'],
              urlToImage: element['urlToImage']
          );

          news.add(articleModel);

        }
      });
    }

  }


}