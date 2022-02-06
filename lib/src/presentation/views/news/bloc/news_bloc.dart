import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/src/core/domain/entity/news_entity.dart';
import 'package:flutter_application_1/src/core/domain/usecase/news_usecase.dart';
import 'package:injectable/injectable.dart';

part 'news_event.dart';
part 'news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUsecase newsUsecase;
  NewsBloc(this.newsUsecase) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetNews) {
        emit(NewsLoading());
        final result = await newsUsecase.call('');
        emit(NewsLoaded(result));
      }
    });
  }
}
