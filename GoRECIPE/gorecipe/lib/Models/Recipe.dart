import 'dart:core';
import 'dart:convert';
import 'package:gorecipe/Models/Ingredient.dart';

class Recipe {
  final String content;
  final List<dynamic> ingredients;
  final String name;
  final int prepTime;
  final String sourceURL;
  final int spoonacularId;
  final String videoURL;

  const Recipe({
    required this.content,
    required this.ingredients,
    required this.name,
    required this.prepTime,
    required this.sourceURL,
    required this.spoonacularId,
    required this.videoURL,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List ingList = Ingredient.ingToList(jsonEncode(json['ingredients']));
    return Recipe(
      content: json['content'],
      ingredients: ingList,
      name: json['name'],
      prepTime: json['prepTime'],
      sourceURL: json['sourceURL'],
      spoonacularId: json['spoonacularId'],
      videoURL: json['videoURL'],
    );
  }

  static List<Recipe> ingToList(String jsonData) {
    List<Recipe> recipes = (jsonDecode(jsonData) as List)
        .map((data) => Recipe.fromJson(data))
        .toList();

    return recipes;
  }

  @override
  String toString() {
    return 'Recipe{name: $name, content: $content, ingredients: $ingredients, videoURL: $videoURL }';
  }
}
