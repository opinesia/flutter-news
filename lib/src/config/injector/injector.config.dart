// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/data/datasource/remote/remote_datasource.dart' as _i3;
import '../../core/data/repositories/news_repository.dart' as _i5;
import '../../core/domain/repositories/news_repository.dart' as _i4;
import '../../core/domain/usecase/news_usecase.dart' as _i6;
import '../../presentation/views/news/bloc/news_bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.RemoteDatasource>(() => _i3.RemoteDatasourceImpl());
  gh.lazySingleton<_i4.NewsRepository>(() =>
      _i5.NewsRepositoryImpl(remoteDatasource: get<_i3.RemoteDatasource>()));
  gh.lazySingleton<_i6.NewsUsecase>(
      () => _i6.NewsUsecase(newsRepository: get<_i4.NewsRepository>()));
  gh.factory<_i7.NewsBloc>(() => _i7.NewsBloc(get<_i6.NewsUsecase>()));
  return get;
}
