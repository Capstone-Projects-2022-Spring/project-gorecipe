import 'dart:core';

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

  @override
  String toString() {
    return 'Ingredient{name: $name}';
  }
}
