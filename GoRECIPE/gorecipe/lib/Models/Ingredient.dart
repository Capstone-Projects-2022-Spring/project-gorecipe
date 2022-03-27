import 'dart:core';

import 'dart:convert';


class Ingredient {
  final String name;

  const Ingredient({
    required this.name,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
    );
  }

  static List ingToList(String jsonData) {
    List ingredients = (jsonDecode(jsonData) as List)
        .map((data) => Ingredient.fromJson(data).name)
        .toList();

    return ingredients;
  }

  static List verboseIngToList(String jsonData) {
    //print("JASON'S DATA" + jsonData);
    List ingredients = (jsonDecode(jsonData) as List);

    return ingredients;
  }

  @override
  String toString() {
    return 'Ingredient{name: $name}';
  }
}
