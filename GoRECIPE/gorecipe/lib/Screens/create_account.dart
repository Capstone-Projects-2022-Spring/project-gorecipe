// ignore: file_names
import 'package:flutter/material.dart';

//place holder for create account page
//linked to the create account button on login page

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('this is the create account page'),
          ]),
    ));
  }
}
