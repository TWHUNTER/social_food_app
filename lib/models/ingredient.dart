part of 'explore_recipe.dart';

class Ingredients {
  final String imageUrl;
  final String title;
  final String source;

  Ingredients({
    required this.imageUrl,
    required this.title,
    required this.source,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
    imageUrl: json["imageUrl"],
    title: json["title"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "imageUrl": imageUrl,
    "title": title,
    "source": source,
  };
}
