import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  //changing the main

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GoRecipe',
        theme: ThemeData(
            //can use this if we end up wanting to change theme colors
            ),

        // ignore: prefer_const_constructors
        home: const WelcomeScreen(
            key: ObjectKey('Welcome Page'), title: 'Welcome Page'));
  }
}
