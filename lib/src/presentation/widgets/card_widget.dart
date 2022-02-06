import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/domain/entity/articles_entity.dart';
import 'package:jiffy/jiffy.dart';

class CustomCard extends StatelessWidget {
  final ArticlesEntity article;
  const CustomCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
            Radius.circular(10.0) //                 <--- border radius here
            ),
      ),
      margin: const EdgeInsets.all(5),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.network(
              article.urlToImage,
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Jiffy(article.publishedAt).yMMMMEEEEd.toString()),
                const SizedBox(height: 10),
                SizedBox(width: 250, child: Text(article.title)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
