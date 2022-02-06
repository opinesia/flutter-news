import 'package:flutter_application_1/src/core/data/models/news_model.dart';

abstract class NewsRepository {
  Future<NewsModel> getNews({required String keyword});
}
