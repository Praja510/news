import 'package:flutter/material.dart';
import 'package:news/news_item.dart';
import 'package:news/service.dart';

import 'details_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsScreen'),
      ),
      body: FutureBuilder(
        future: Service.getArticleData(),
        builder: ((context, snapshot) {
          return snapshot.data != null
              ? buildListArticle(snapshot.data as List<Article>)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }

  buildListArticle(List<Article> articles) => ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return Padding(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () {
              final route = MaterialPageRoute(builder: (context) => DetailNewsScreen(article: article));
              Navigator.push(context, route);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              elevation: 5,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        article.urlToImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            article.author,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          article.publishedAt.toString(),
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[400],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
