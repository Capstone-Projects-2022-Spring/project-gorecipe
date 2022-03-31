//this file creates the login page with options to login or create an account
// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/create_account.dart';
import 'package:gorecipe/Screens/home_screen.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/welcome_screen.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/scan_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../globals.dart' as globals;
import '../../Models/User.dart';

// ignore: camel_case_types
class Welcome_Screen_State extends StatefulWidget {
  const Welcome_Screen_State({Key? key}) : super(key: key);

  @override
  State<Welcome_Screen_State> createState() => _Welcome_Screen_State();
}

// ignore: camel_case_types
class _Welcome_Screen_State extends State<Welcome_Screen_State> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final _formKey = GlobalKey<FormState>();
  String? _password;
  String? _username;

  static const snackBar = SnackBar(
    content: Text(
        'Username and/or password incorrect. Try again, or create an account.'),
  );

  Future auth({required String? username, required String? password}) async {
    final response = await http.post(
      Uri.parse(
          'http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/login?password=' +
              _password.toString() +
              '&username=' +
              _username.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*',
      },
    );

    if (response.statusCode == 200) {
      globals.user = User.fromJson(jsonDecode(response.body));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

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

  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool _passwordVisible = false;
  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      //keyboardType: TextInputType.emailAddress,
      onSaved: (value) => _username = value,
      decoration: InputDecoration(
          //   labelText: "Username",
          // fillColor: Color.fromARGB(255, 116, 163, 126),
          fillColor: const Color.fromARGB(255, 116, 163, 126),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final passwordField = TextFormField(
      controller: passwordController,
      onSaved: (value) => _password = value,
      // obscureText: true,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
          //labelText: "Password",
          //fillColor: Color.fromARGB(255, 116, 163, 126),
          filled: true,
          fillColor: const Color.fromARGB(255, 116, 163, 126),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final loginButton = MaterialButton(
      child: Text("Sign in",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      onPressed: () {
        final form = _formKey.currentState;
        form!.save();
        auth(username: _username, password: _password);
      },
    );

    // ignore: unused_local_variable
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

    final passwordCheckbox = CheckboxListTile(
      title: const Text('Show Password'),
      value: _passwordVisible,
      onChanged: (bool? value) {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/ingredients.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.35), BlendMode.dstATop),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                  passwordCheckbox,
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
