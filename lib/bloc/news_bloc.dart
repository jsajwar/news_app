import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/repository/news_repo.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepo postRepository = NewsRepo();

  NewsBloc() : super(NewsState()) {
    on<FetchNewsChannelHeadlines>(fetchChannelNews);
    on<NewsCategories>(fetchNewsCategoires);
  }

  Future<void> fetchChannelNews(
      FetchNewsChannelHeadlines event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: Status.initial));

    await postRepository.fetchNewsModel().then((value) {
      emit(state.copyWith(
          status: Status.success, newsList: value, message: 'success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          categoriesStatus: Status.failure,
          categoriesMessage: error.toString()));
    });
  }

  Future<void> fetchNewsCategoires(
      NewsCategories event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: Status.initial));

    await postRepository.fetchNewsCategoires(event.category).then((value) {
      emit(state.copyWith(
          categoriesStatus: Status.success,
          categoriesNewsModel: value,
          categoriesMessage: 'success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          categoriesStatus: Status.failure,
          categoriesMessage: error.toString()));
      emit(state.copyWith(status: Status.failure, message: error.toString()));
    });
  }
}
