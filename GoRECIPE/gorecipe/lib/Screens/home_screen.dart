import 'package:flutter/material.dart';

//place holder for when the home page is actually coded
//linked to login button of welcome page
//** still have to figure out verifying login credentials before being sent to this page

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('this is the home page'),
          ]),
    ));
  }
}
