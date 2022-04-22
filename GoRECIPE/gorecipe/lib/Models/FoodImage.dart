import 'dart:core';
import 'dart:convert';
import 'package:gorecipe/Models/Ingredient.dart';
import 'package:gorecipe/Models/User.dart';

class FoodImage {
  final String s3objectId;
  final List<dynamic> imageOf;
  final User uploadedBy;

  const FoodImage({
    required this.imageOf,
    required this.s3objectId,
    required this.uploadedBy,
  });

  factory FoodImage.fromJson(Map<String, dynamic> json) {
    List ingList = Ingredient.ingToList(jsonEncode(json['imageOf']));
    return FoodImage(
      s3objectId: json['s3objectId'],
      imageOf: ingList,
      uploadedBy: User.fromJson(json['uploadedBy']),
    );
  }

  static List<FoodImage> foodImgToList(String jsonData) {
    List<FoodImage> FoodImages = (jsonDecode(jsonData) as List)
        .map((data) => FoodImage.fromJson(data))
        .toList();

    return FoodImages;
  }

  static bool checkIngredient(String ingredient, List<dynamic> ingList) {
    for (String item in ingList) {
      print("ITEM:" + item);
      if (item.contains(ingredient)) {
        return true;
      }
    }
    return false;
  }

  static List<String> instructionsToList(String instructions) {
    String parsed = instructions.replaceAll("\n", " ");
    //print(parsed);
    return List.from(parsed.split('.').where((time) => time != ""));
  }

  @override
  String toString() {
    return 'FoodImage{}';
  }
}
