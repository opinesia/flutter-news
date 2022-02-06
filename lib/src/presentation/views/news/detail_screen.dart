import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/domain/entity/articles_entity.dart';
import 'package:jiffy/jiffy.dart';

class DetailScreen extends StatelessWidget {
  final ArticlesEntity article;
  const DetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          article.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(
            article.urlToImage,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Text(article.author),
              Text(article.source.name),
              Text(Jiffy(article.publishedAt).yMMMMEEEEd.toString()),
            ]),
          ),
          Text(article.content),
        ],
      ),
    );
  }
}
