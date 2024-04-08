class NewsModel {
  String? status;

  List<Articles>? articles;

  NewsModel({this.status, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((value) {
        articles!.add(Articles.fromJson(value));
      });
    }
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];

    content = json['content'];
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
