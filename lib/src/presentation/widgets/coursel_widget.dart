import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/domain/entity/articles_entity.dart';
import 'package:flutter_application_1/src/presentation/views/news/detail_screen.dart';

class CourselWidget extends StatelessWidget {
  final List<ArticlesEntity> article;
  const CourselWidget({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      height: 200,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: article.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      article: article[itemIndex],
                    ),
                  ),
                );
              },
              child: Image.network(
                article[itemIndex].urlToImage,
                width: MediaQuery.of(context).size.width - 92,
                height: 400,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 92,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(article[itemIndex].title)),
            ),
          ],
        ),
      ),
    );
  }
}
