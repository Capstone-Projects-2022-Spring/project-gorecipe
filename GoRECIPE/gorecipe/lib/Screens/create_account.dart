// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/Components/welcome_page.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
// ignore: unused_import
import 'dart:typed_data';
import '../Models/User.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
// ignore: unused_import
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
//place holder for create account page

//linked to the create account button on login page

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
  // ignore: unused_field
  //API Connection

  late User currentUser;

  @override
  void initState() {
    super.initState();
  }

  Future createUser({required int userId}) async {
    // ignore: unused_local_variable
    final response = await http.get(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' +
            userId.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*'
        });

    //User user = User.fromJson(jsonEncode(response.body));

    setState(() {
      //currentUser = user;
    });
  }

  //Field setup
  bool _passwordVisible = false;
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ignore: unused_element

  @override
  Widget build(BuildContext context) {
    signup(firstName, lastName, username, email, password) async {
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      // ignore: avoid_print
      print("Calling Create Acc");

      Map<String, dynamic> data = {
        'id': 0,
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'savedRecipes': [],
        'favoriteIngredients': [],
        'dietaryRestrictions': [],
        'birthDate': '2022-03-13'
      };

      User user = User.fromJson(data);
      // ignore: avoid_print
      print({
        "birthDate": "2022-03-22",
        "dietaryRestrictions": [],
        "email": "test@e.com",
        "favoriteIngredients": [],
        "firstName": "testy",
        "id": 0,
        "lastName": "mctesterson",
        "password": "password",
        "savedRecipes": [],
        "username": "testman"
      });

      // ignore: avoid_print
      print("USER");
      // ignore: avoid_print
      print(user);

      final response = await http.post(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode(user.toJson()),
      );

      // ignore: avoid_print
      print(response.statusCode);
      // ignore: avoid_print
      print(response.body);
      if (response.statusCode == 200) {
        // setState(() {});
        // //Map<String, dynamic> userData = jsonDecode(response.body);
        // print(userData);
        // if (!userData['error']) {
        //   //Map<String, dynamic> user = userData['data'];
        //   //print(user);
        //   //savePref(1, user['name'], user['email'], user['id']);

        // } else {
        //   print(" ${userData['message']}");
        // }
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Account Created")));

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WelcomeScreen(
                    key: ObjectKey('Welcome Page'), title: 'Welcome Page')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Please Try again")));
      }
    }

    const headerText = Text(
      "Create Account",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    final firstNameField = SizedBox(
      width: 145.0,
      child: TextField(
        controller: firstNameController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 116, 163, 126),
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "First",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      ),
    );
    final lastNameField = SizedBox(
      width: 145.0,
      child: TextField(
        controller: lastNameController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 116, 163, 126),
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Last",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      ),
    );
    final usernameField = TextField(
      controller: usernameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 116, 163, 126),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 116, 163, 126),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final passwordField = TextField(
      controller: passwordController,
      obscureText: !_passwordVisible,
      style: style,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 116, 163, 126),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );
    final confirmPasswordField = TextField(
      controller: confirmPasswordController,
      obscureText: !_passwordVisible,
      style: style,
      decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 116, 163, 126),
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final createAccountButton = MaterialButton(
      child: Text("Create Account",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      onPressed: () {
        signup(
            firstNameController.text,
            lastNameController.text,
            usernameController.text,
            emailController.text,
            passwordController.text);
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
    //Scaffold that holds create account field/button children

    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Declaring sizes of field boxes
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
                const SizedBox(height: 15.0),
                headerText,
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    firstNameField,
                    const SizedBox(width: 10.0),
                    lastNameField,
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                usernameField,
                const SizedBox(
                  height: 20.0,
                ),
                emailField,
                const SizedBox(
                  height: 20.0,
                ),
                passwordField,
                const SizedBox(
                  height: 15.0,
                ),
                confirmPasswordField,
                passwordCheckbox,
                createAccountButton,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
