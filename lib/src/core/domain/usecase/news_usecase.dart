import 'package:flutter_application_1/src/core/domain/entity/news_entity.dart';
import 'package:flutter_application_1/src/core/domain/repositories/news_repository.dart';
import 'package:flutter_application_1/src/core/utils/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NewsUsecase implements UseCase<NewsEntity, String> {
  NewsRepository newsRepository;
  NewsUsecase({required this.newsRepository});

  @override
  Future<NewsEntity> call(String payload) {
    return newsRepository.getNews(keyword: payload);
  }
}
