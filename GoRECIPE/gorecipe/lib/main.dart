import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/scan_screen.dart';

/*void main() {
  runApp(const MyApp());
}
*/

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GoRecipe',
        theme: ThemeData(
            //can use this if we end up wanting to change theme colors
            ),

        // ignore: prefer_const_constructors
        home: const WelcomeScreen(
            key: ObjectKey('Welcome Page'), title: 'Welcome Page'));
  }
}
