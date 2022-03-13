import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/create_account.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';

// ignore: camel_case_types
class Welcome_Page extends State<WelcomeScreen> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final login = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        splashColor: const Color.fromARGB(255, 153, 30, 30),
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Text("Sign In",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    final createAcc = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateAccount()),
          );
        },
        child: Text("Create Acount",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/images/welcome_page.png',
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: 60.0,
                  right: 70.0,
                  left: 70.0,
                  child: Column(
                    children: <Widget>[
                      login,
                      const SizedBox(
                        height: 3.0,
                      ),
                      createAcc,
                      const SizedBox(
                        height: 1.0,
                      ),
                    ],
                  ),
                )
              ],
            )));
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
