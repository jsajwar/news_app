import 'package:news_app/api_services/catergorymodel.dart';
import 'package:news_app/api_services/newsmodel.dart';
import 'package:news_app/repository/news_repo.dart';

class NewsVeiwModel {
  final rep = NewsRepo();

  Future<NewsModel> fetchNewsModal() async {
    final response = await rep.fetchNewsModel();
    return response;
  }

  Future<CategoriesNewsModel> fetchNewsCategoires(String category) async {
    final response = await rep.fetchNewsCategoires(category);
    return response;
  }
}
