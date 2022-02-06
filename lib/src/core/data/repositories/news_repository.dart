import 'package:flutter_application_1/src/core/data/datasource/remote/remote_datasource.dart';
import 'package:flutter_application_1/src/core/data/models/news_model.dart';
import 'package:flutter_application_1/src/core/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final RemoteDatasource remoteDatasource;

  NewsRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<NewsModel> getNews({required String keyword}) async {
    final response = await remoteDatasource.getData(search: keyword);
    return NewsModel.fromJson(response);
  }
}
