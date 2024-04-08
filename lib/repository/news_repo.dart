import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/api_services/catergorymodel.dart';
import 'package:news_app/api_services/newsmodel.dart';

class NewsRepo {
  Future<NewsModel> fetchNewsModel() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=2ad5a3be65ba42d899ff6720d79f0360';

    final response = await http.get(Uri.parse(url));
    log(response.body);

    if (response.statusCode == 200) {
      final news = jsonDecode(response.body);

      return NewsModel.fromJson(news);
    }
    throw Exception('Error');
  }

  Future<CategoriesNewsModel> fetchNewsCategoires(String category) async {
    String newsUrl =
        'https://newsapi.org/v2/everything?q=$category&apiKey=8a5ec37e26f845dcb4c2b78463734448';
    final response = await http.get(Uri.parse(newsUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return CategoriesNewsModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }
}
