//this file creates the login page with options to login or create an account
// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/create_account.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/scan_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: camel_case_types
class Welcome_Screen_State extends State<WelcomeScreen> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final _formKey = GlobalKey<FormState>();
  String? _password;
  String? _username;

  bool login = false;

  Future auth({required String? username, required String? password}) async {
    final response = await http.post(
      Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/login?password=' + _password.toString() + '&username=' + _username.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*',
      },
    );

    print(response.statusCode);

    /*final response = await http.get(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/login?password=' + _password! + '&username' + _username!),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*'
        });*/

    //print(jsonDecode(response.body));

    //User user = User.fromJson(jsonDecode(response.body));

    //setState(() {
      //currentUser = user;
    //});
  }

  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      //keyboardType: TextInputType.emailAddress,
        onSaved: (value) => _username = value,
        decoration: const InputDecoration(labelText: "Username"));

    final passwordField = TextFormField(
        onSaved: (value) => _password = value,
        obscureText: true,
        decoration: const InputDecoration(labelText: "Password"));

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xFF689F38),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
          // save the fields..
          final form = _formKey.currentState;
          form!.save();
          auth(username: _username, password: _password);

          // Validate will return true if is valid, or false if invalid.
          if (form.validate()) {
            print("$_username $_password");
          };
        },
        child: Text("Sign in",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final createAccountButton = MaterialButton(
      child: Text("Create an account",
          textAlign: TextAlign.center,
          style:
          style.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateAccount()),
        );
      },
    );

    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/images/ingredients.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.2), BlendMode.dstATop),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      //Declaring sizes of field boxes
                      const SizedBox(height: 45.0),
                      usernameField,
                      const SizedBox(height: 25.0),
                      passwordField,
                      const SizedBox(
                        height: 35.0,
                      ),
                      loginButton,
                      const SizedBox(
                        height: 15.0,
                      ),
                      createAccountButton,
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ),
        ));
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}


