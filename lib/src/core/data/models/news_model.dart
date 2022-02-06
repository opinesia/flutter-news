import 'package:flutter_application_1/src/core/data/models/articles_model.dart';
import 'package:flutter_application_1/src/core/domain/entity/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel({
    required String status,
    required int totalResults,
    required List<ArticlesModel> articles,
  }) : super(
          status: status,
          totalResults: totalResults,
          articles: articles,
        );
  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? '',
      articles: (json['articles'] as List)
          .map(
            (e) => ArticlesModel.fromJson(e),
          )
          .toList(),
    );
  }
}
