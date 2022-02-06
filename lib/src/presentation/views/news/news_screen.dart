import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/core/domain/entity/news_entity.dart';
import 'package:flutter_application_1/src/presentation/views/news/bloc/news_bloc.dart';
import 'package:flutter_application_1/src/presentation/widgets/card_widget.dart';
import 'package:flutter_application_1/src/presentation/widgets/coursel_widget.dart';
import 'package:flutter_application_1/src/presentation/views/news/detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late NewsBloc bloc;
  late NewsEntity news;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NewsBloc>(context);
    if (mounted) {
      bloc.add(GetNews());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NewsAPI',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoaded) {
            news = state.news;
            return Container(
              color: const Color(0xffdce0e0),
              child: Stack(
                children: [
                  CourselWidget(
                    article: news.articles,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 230,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      'Trending',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 260),
                    child: ListView(
                      children: List.generate(
                        news.articles.length,
                        (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  article: news.articles[index],
                                ),
                              ),
                            );
                          },
                          child: CustomCard(
                            article: news.articles[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
