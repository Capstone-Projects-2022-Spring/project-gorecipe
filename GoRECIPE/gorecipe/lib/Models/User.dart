import 'dart:core';

class User {

  final int id;
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  final String birthDate;

  // we dont need these yet so let's not worry about them not working
  // final List<dynamic> dietaryRestrictions;
  // final List<dynamic> favoriteIngredients;
  // final List<Object> savedRecipes;

  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthDate});
    // required this.dietaryRestrictions,
    // required this.favoriteIngredients,
    // required this.savedRecipes});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        birthDate: json['birthDate']);
        // dietaryRestrictions: json['dietaryRestrictions'],
        // favoriteIngredients: json['favoriteIngredients'],
        // savedRecipes: json['savedRecpes']);
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, password: $password, email: $email, firstName: $firstName, lastName: $lastName, birthDate: $birthDate}';
  }
}
