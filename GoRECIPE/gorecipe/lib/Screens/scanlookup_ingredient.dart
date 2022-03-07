import 'package:flutter/material.dart';

//linked to the add ingredient button on add ingredient page

class ScanLookup extends StatefulWidget {
  const ScanLookup({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ScanLookup> createState() => _ScanLookup();
}

class _ScanLookup extends State<ScanLookup> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    const scanText = Text(
      "Scan Ingredient",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    final scanButton = IconButton(
      icon: Image.asset('assets/images/logo.png'),
      iconSize: 200,
      onPressed: () {},
    );

    const lookupText = Text(
      "Look Up Ingredient",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    final lookupButton = IconButton(
      icon: Image.asset('assets/images/logo.png'),
      iconSize: 200,
      onPressed: () {},
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
                const SizedBox(height: 55.0),
                scanText,
                const SizedBox(height: 65.0),
                scanButton,
                Divider(color: Colors.black, height: 150.0),
                const SizedBox(height: 55.0),
                lookupText,
                const SizedBox(height: 65.0),
                lookupButton,
                const SizedBox(
                  height: 35.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
