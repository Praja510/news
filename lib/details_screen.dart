import 'package:flutter/material.dart';
import 'package:news/news_item.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({Key? key, required this.article})
      : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News'),
      ),
      body: Column(
        children: [
          Image.network(article.urlToImage),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(article.content),
          ),
          Text(article.publishedAt.toString(),),
        ],
      ),
    );
  }
}
