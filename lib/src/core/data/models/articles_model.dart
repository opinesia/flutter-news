import 'package:flutter_application_1/src/core/data/models/source_model.dart';
import 'package:flutter_application_1/src/core/domain/entity/articles_entity.dart';

class ArticlesModel extends ArticlesEntity {
  const ArticlesModel({
    required SourceModel source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );
  factory ArticlesModel.fromJson(dynamic json) {
    return ArticlesModel(
        source: SourceModel.fromJson(json['source']),
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        publishedAt: json['publishedAt'] ?? '',
        content: json['content'] ?? '');
  }
}
