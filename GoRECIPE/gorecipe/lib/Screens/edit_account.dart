import 'dart:convert';

import 'package:flutter/material.dart';
import '../Models/User.dart';

import 'package:http/http.dart' as http;

//linked to the edit account button on profile page

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<EditAccount> createState() => _EditAccount();


}

class _EditAccount extends State<EditAccount> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  @override
  void initState() {
    super.initState();
    getUser(userId: 1);
  }

  late User currentUser;

  Future getUser({required int userId}) async {

    final response = await http.get(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' + userId.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin' : '*'
        });

    User user = User.fromJson(jsonDecode(response.body));

    setState(() {
      currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {

    final profileButton = IconButton(
      icon: Image.asset('assets/images/default_pfp.png'),
      iconSize: 200,
      onPressed: () {},
    );

    final nameField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: currentUser.firstName + " " + currentUser.lastName,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final usernameField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: currentUser.username,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final locationField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Location",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final editButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xFF689F38),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //send new data to serverm return to profile
        },
        child: Text("Finish",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Declaring sizes of field boxes
                const SizedBox(height: 20.0),
                profileButton,
                const SizedBox(height: 75.0),
                nameField,
                const SizedBox(height: 25.0),
                usernameField,
                const SizedBox(height: 25.0),
                locationField,
                const SizedBox(
                  height: 35.0,
                ),
                editButton,
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
