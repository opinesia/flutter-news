import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class RemoteDatasource {
  Future<T> getData<T>({required String search});
}

@LazySingleton(as: RemoteDatasource)
class RemoteDatasourceImpl implements RemoteDatasource {
  RemoteDatasourceImpl();

  @override
  Future<T> getData<T>({required String search}) async {
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=559a3eab55c94893b4ad0b1638c39b96&pageSize=20',
      ),
    );
    return json.decode(response.body);
  }
}
