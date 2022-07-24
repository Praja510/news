import 'package:http/http.dart' as http;
import 'package:news/news_item.dart';
import 'dart:convert';

class Service {
  static Future<List<Article>> getArticleData() async {
    const url = "https://newsapi.org/v2/top-headlines?country=id&apiKey=6fdf252fadc34970895be2835ed2e8b4";
    final response = await http
        .get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final responseBody = jsonDecode(response.body);
      final result = responseBody["articles"] as List;
      List<Article> listArticle = result.map((json) => Article.fromJson(json)).toList();
      return listArticle;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}