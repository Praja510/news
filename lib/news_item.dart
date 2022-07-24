class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  // Untuk getData
  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] ?? 'Author tidak dikethaui',
    title: json["title"] ?? "title tidak ada",
    description: json["description"] ?? "description tidak ada",
    url: json["url"] ?? 'url tidak ada',
    urlToImage: json["urlToImage"] ?? "null",
    publishedAt: DateTime.parse(json["publishedAt"] ?? DateTime.now().toIso8601String()),
    content: json["content"] ?? "konten tidak ada",
  );

  // Untuk ngirimData
  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author == null ? null : author,
    "title": title,
    "description": description == null ? null : description,
    "url": url,
    "urlToImage": urlToImage == null ? null : urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content == null ? null : content,
  };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] == null ? null : json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name,
  };
}
