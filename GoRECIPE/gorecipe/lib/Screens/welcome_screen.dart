import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/Components/welcome_screen_state.dart';
//declaring state for welcome screen

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({required Key key, required this.title})
      : super(key: key);

  final String title;
  @override
  Welcome_Screen_State createState() => Welcome_Screen_State();
}
