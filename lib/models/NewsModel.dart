


class Article {
    dynamic author;
    dynamic content;
    dynamic description;
    dynamic publishedAt;
    dynamic source;
    dynamic title;
    dynamic url;
    dynamic urlToImage;

    Article({required this.author, required this.content, required this.description, required this.publishedAt, required this.source, required this.title, required this.url, required this.urlToImage});

    factory Article.fromJson( Map<String, dynamic> json) {
        return Article(
            author: json['author']  ,
            content: json['content'] ,
            description: json['description'] ,
            publishedAt: json['publishedAt'],
            source: json['source'] ,
            title: json['title'],
            url: json['url'],
            urlToImage: json['urlToImage'],
        );
    }


}

class Source {
    Object id;
    String name;

    Source({required this.id, required this.name});

    factory Source.fromJson(Map<String, dynamic> json) {
        return Source(
            id: json['id'] ,
            name: json['name'],
        );
    }


}