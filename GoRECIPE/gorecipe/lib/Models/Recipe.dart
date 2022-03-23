import 'dart:core';

class Recipe {
  final int id;
  final String content;
  final String ingredients;
  final String name;
  final String videoURL;

  const Recipe({
    required this.id,
    required this.content,
    required this.ingredients,
    required this.name,
    required this.videoURL,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      content: json['content'],
      ingredients: json['ingredients'],
      name: json['name'],
      videoURL: json['videoURL'],
    );
  }

  @override
  String toString() {
    return 'Recipe{id: $id, content: $content, ingredients: $ingredients, name: $name, videoURL: $videoURL }';
  }
}
