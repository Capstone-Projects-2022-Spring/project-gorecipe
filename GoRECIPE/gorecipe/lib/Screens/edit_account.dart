import 'dart:io';

import 'package:flutter/material.dart';
import '../Models/User.dart';
import '../../globals.dart' as globals;
import 'package:gorecipe/Screens/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//linked to the edit account button on profile page

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccount();
}

class _EditAccount extends State<EditAccount> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  late User currentUser;
  late Map<String, dynamic> userMap;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentUser = globals.user;
  }

  Future<User> patchUser(
      {required String usernamechange, required String emailchange}) async {
    final response = await http.patch(
      Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' +
          currentUser.id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.contentTypeHeader: 'application/json',
        'Access-Control-Allow-Origin': '*'
      },
      body: jsonEncode(<String, String>{
        'username': usernamechange,
        'email': emailchange,
      }),
    );
    print(response.body);
    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    final profileButton = IconButton(
      icon: Image.asset('assets/images/default_pfp.png'),
      iconSize: 200,
      onPressed: () {},
    );

    final usernameField = TextField(
      controller: usernameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: currentUser.username,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
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
          setState(() {
            currentUser.username = usernameController.text;
            currentUser.email = emailController.text;
            patchUser(
                usernamechange: usernameController.text,
                emailchange: emailController.text);
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(
                      key: GlobalKey(),
                      title: "Profile",
                    )),
          );
        },
        child: Text("Finish",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
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
                  const SizedBox(height: 25.0),
                  usernameField,
                  const SizedBox(height: 25.0),
                  emailField,
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
      ),
    );
  }
}
