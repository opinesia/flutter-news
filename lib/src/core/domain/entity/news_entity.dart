import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/src/core/domain/entity/articles_entity.dart';

class NewsEntity extends Equatable {
  final String status;
  final int totalResults;
  final List<ArticlesEntity> articles;

  const NewsEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  @override
  List<Object> get props => [status, totalResults, articles];

  NewsEntity copyWith({
    String? status,
    int? totalResults,
    List<ArticlesEntity>? articles,
  }) =>
      NewsEntity(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );
}
