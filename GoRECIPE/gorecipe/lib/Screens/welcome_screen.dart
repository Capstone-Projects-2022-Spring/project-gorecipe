import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/Components/Welcome_Page.dart';
//declaring state for welcome screen

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({required Key key, required this.title})
      : super(key: key);

  final String title;
  @override
  Welcome_Page createState() => Welcome_Page();
}
