import 'package:flutter_application_1/src/core/domain/entity/news_entity.dart';
import 'package:flutter_application_1/src/core/domain/usecase/news_usecase.dart';
import 'package:flutter_application_1/src/presentation/views/news/bloc/news_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

class MockNewsUsecase extends Mock implements NewsUsecase {}

void main() {
  late NewsBloc bloc;
  late NewsUsecase newsUsecase;

  setUp(() {
    newsUsecase = MockNewsUsecase();

    bloc = NewsBloc(newsUsecase);
  });

  group('bloc test', () {
    blocTest<NewsBloc, NewsState>(
      'emits [MyState] when MyEvent is added.',
      build: () {
        when(() => newsUsecase.call(any())).thenAnswer(
          (_) async =>
              const NewsEntity(status: 'status', totalResults: 1, articles: []),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(GetNews()),
      expect: () => [isA<NewsLoading>(), isA<NewsLoaded>()],
    );
  });
}
