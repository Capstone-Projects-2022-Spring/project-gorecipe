// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';

class WantToAdd extends StatefulWidget {
  const WantToAdd({required Key key, required this.title}) : super(key: key);

  final String title;
  @override
  State<WantToAdd> createState() => _WantToAdd();
}

class _WantToAdd extends State<WantToAdd> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    const headerText = Text(
      "Do you want to add this ingredient (insert ingredient name from image processing)?",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    bool buttonPressed = false;

    final yesButton = MaterialButton(
        child: Text("Yes",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
        onPressed: () {
          buttonPressed = true;
          // this means we send the ingredient to be added to the list

          // this will lead to the recipes for you page
          // Navigator.push(
          // context,
          //MaterialPageRoute(builder: (context) => const ()),
        });

    final noButton = MaterialButton(
        child: Text("No",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
        onPressed: () {
          // Navigator.push(
          // context,
          //MaterialPageRoute(builder: (context) => const RetrievePassword()),
        });

    final backButton = MaterialButton(
      child: Text("<-",
          textAlign: TextAlign.left,
          style:
              style.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const WelcomeScreen(
                  key: ObjectKey('Welcome Page'), title: 'Welcome Page')),
        );
      },
    );

    return Scaffold(
      // do we want to change the color of the background?
      // backgroundColor: Colors.green[200],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    //this image needs to be replaced with the image they scanned into the app
                    image: AssetImage("assets/images/ingredients.png"),
                    fit: BoxFit.fill),
              ),
            ),
            //Declaring sizes of field boxes
            const SizedBox(height: 45.0),
            headerText,
            const SizedBox(height: 25.0),
            yesButton,
            const SizedBox(
              height: 35.0,
            ),
            noButton,
            const SizedBox(
              height: 15.0,
            ),
            backButton,
            const SizedBox(
              height: 5.0,
            )
          ],
        ),
      ),
    );
  }

  // ignore: todo
  // TODO: implement build

}
