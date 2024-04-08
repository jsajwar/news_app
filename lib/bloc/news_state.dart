import 'package:equatable/equatable.dart';
import 'package:news_app/api_services/catergorymodel.dart';
import 'package:news_app/api_services/newsmodel.dart';

enum Status { initial, success, failure }

class NewsState extends Equatable {
  NewsState({
    this.status = Status.initial,
    this.categoriesStatus = Status.initial,
    this.categoriesMessage = '',
    this.message = '',
    NewsModel? newsList,
    CategoriesNewsModel? categoriesNewsModel,
  })  : newsList = newsList ?? NewsModel(),
        newsCategoriesList = categoriesNewsModel ?? CategoriesNewsModel();

  final Status status;
  final NewsModel? newsList;
  final String message;
  final Status categoriesStatus;
  final String categoriesMessage;
  final CategoriesNewsModel? newsCategoriesList;

  NewsState copyWith(
      {Status? status,
      NewsModel? newsList,
      String? message,
      CategoriesNewsModel? categoriesNewsModel,
      String? categoriesMessage,
      Status? categoriesStatus}) {
    return NewsState(
      status: status ?? this.status,
      newsList: newsList ?? this.newsList,
      message: message ?? this.message,
      categoriesMessage: message ?? this.categoriesMessage,
      categoriesNewsModel: categoriesNewsModel ?? newsCategoriesList,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $message,}''';
  }

  @override
  List<Object?> get props =>
      [status, newsList, message, identityHashCode(this)];
}
