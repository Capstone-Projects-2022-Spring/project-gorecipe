import 'package:flutter/material.dart';

// View profile page

class Profile extends StatefulWidget {
  //const Profile({Key? key}) : super(key: key);
  const Profile({required Key key, required this.title})
      : super(key: key);

  final String title;
  @override
  State<Profile> createState() => _Profile();
}


class _Profile extends State<Profile> {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }

}