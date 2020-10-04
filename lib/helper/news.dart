import 'dart:convert';

import 'package:newsapp/models/aricle_model.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/keys/key.dart';

class News {
  List<ArticleModel> feeds = [];

  Future<void> getNews() async {
    Keys obj = Keys();
    String keyCode = obj.getKey();
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$keyCode";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel object = new ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              imageUrl: element['urlToImage'],
              content: element['content']);

          feeds.add(object);
        }
      });
    }
  }
}
