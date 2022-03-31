import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/create_account.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/welcome_screen_state.dart';

// ignore: camel_case_types
class Welcome_Page extends State<WelcomeScreen> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final login = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        splashColor: const Color.fromARGB(255, 153, 30, 30),
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          //Navigator.push(
          //  context, MaterialPageRoute(builder: (context) => HomeScreen()));

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Welcome_Screen_State()),
          );
        },
        child: Text("Sign In",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    // ignore: unused_local_variable
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

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          // Navigator.push(context,
          //   MaterialPageRoute(builder: (context) => const HomeScreen()));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Welcome_Screen_State()));
        },
        child: Text("Sign in",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    final createAccButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),

      //const Color(0xFF689F38),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateAccount()));
        },
        child: Text("Create account",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
            //color: Colors.black,
            child: Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/images/ingredients.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.35), BlendMode.dstATop),
              ),
            ),
            // child: //Image.asset('assets/images/welcome_page.png',
            //   Image.asset('assets/images/ingredients.png',
            //     fit: BoxFit.fill),
          ),
        ),
        //Positioned(
        // bottom: 60.0,
        //right: 70.0,
        //left: 70.0,
        // child:
        Padding(
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
              const SizedBox(height: 60.0),
              loginButton,
              const SizedBox(
                height: 15.0,
              ),
              createAccButton,
              const SizedBox(
                height: 10.0,
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
