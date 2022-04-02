import 'dart:core';

class User {
  final int id;
  String username;
  final String password;
  String email;
  final String firstName;
  final String lastName;
  final String birthDate;

  // we dont need these yet so let's not worry about them not working
  //final List<dynamic> dietaryRestrictions;
  //final List<dynamic> favoriteIngredients;
  //final List<Object> savedRecipes;

  User(
      {required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.birthDate});
  // required this.dietaryRestrictions,
  // required this.favoriteIngredients,
  // required this.savedRecipes

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
    // savedRecipes: json['savedRecpes'
  }

  Map<String, dynamic> toJson() {
    return {
      "birthDate": birthDate,
      "dietaryRestrictions": [],
      "email": email,
      "favoriteIngredients": [],
      "firstName": firstName,
      "id": 0,
      "lastName": lastName,
      "password": password,
      "savedRecipes": [],
      "username": username,
    };
  }

  @override
  String toString() {
    return 'user{id: $id, username: $username, password: $password, email: $email, firstName: $firstName, lastName: $lastName, birthDate: $birthDate, dietaryRestrictions: [], favoriteIngredients:[], savedRecipes, [] }';
  }
}
