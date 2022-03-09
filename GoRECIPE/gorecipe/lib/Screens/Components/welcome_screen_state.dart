//this file creates the login page with options to login or create an account
// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/create_account.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';

// ignore: camel_case_types
class Welcome_Screen_State extends State<WelcomeScreen> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override


    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xFF689F38),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
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
    ));
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
