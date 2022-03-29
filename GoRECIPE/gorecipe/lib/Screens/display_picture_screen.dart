import 'dart:async';
import 'dart:io';
// ignore: unused_import
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gorecipe/Models/Ingredient.dart';
import 'package:gorecipe/Screens/recipes_for_you.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

class DisplayPictureScreen extends StatefulWidget {
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);
  final TextStyle style =
      const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final String imagePath;
  DisplayScreenState createState() => DisplayScreenState();
}

class DisplayScreenState extends State<DisplayPictureScreen> {
  var _foundIngredient = false;
  String _ingredient = "";
  List ingredients = <String>[];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    upload(File img) async {
      var postUri = Uri.parse(
          "http://gorecipe.us-east-2.elasticbeanstalk.com/api/images/upload/3");
      var request = http.MultipartRequest("POST", postUri);
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        await img.readAsBytes(),
        filename: 'image.jpg',
        contentType: MediaType('image', 'jpg'),
      ));
      // ignore: avoid_print
      //print("Request:");
      // ignore: avoid_print
      //print(request);

      var response = await request.send();
      var newResponse = await http.Response.fromStream(response);
      var json = jsonDecode(newResponse.body);
      // ignore: avoid_print

      _foundIngredient = true;

      //print(json);
      setState(() {
        ingredients = Ingredient.ingToList(newResponse.body);
        print(ingredients);
        _ingredient = ingredients[0];
      });

      //print(jason[0]['name']);
      /*
      response.stream.transform(utf8.decoder).listen((value) {
        // ignore: avoid_print
        var formated = value.replaceAll('{', '');
        var formated2 = formated.replaceAll('}', '');
        var formated3 = formated2.replaceAll('[', '{');
        var formated4 = formated3.replaceAll(']', '}');
        var dataSp = formated4.split(',');
        Map<String, String> mapData = Map();
        dataSp.forEach((element) =>
            mapData[element.split(':')[0]] = element.split(':')[1]);

        print(newResponse);
      });
      */
    }

    /*
    getData() async {
      print("In download");
      var uri = Uri.http(
          'www.gorecipe.us-east-2.elasticbeanstalk.com', '/api/users/2');

      var request = http.MultipartRequest("GET", uri);

      print("Request:");
      print(request);
      print(request.headers);

      var response = await request.send();
      print(response.statusCode);
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    }
    */

    final _nextbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 4,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          if (ingredients.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Upload Image First")));
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RecipesYou(ingredientList: ingredients)),
            );
          }
        },
        child: Text("Next",
            textAlign: TextAlign.center,
            style: widget.style
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
    final _uploadbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 4,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          upload(File(widget.imagePath));
          //getData();
        },
        child: Text("Upload",
            textAlign: TextAlign.center,
            style: widget.style
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Display the Picture'),
        backgroundColor: const Color.fromARGB(255, 116, 163, 126),
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Center(
        child: Stack(children: [
          Expanded(
              child: Stack(children: [
            Positioned(
                child: Column(children: <Widget>[
              Image.file(File(widget.imagePath)),
            ])),
            Positioned(
              bottom: 150.0,
              right: 90.0,
              left: 90.0,
              child: Column(
                children: <Widget>[
                  _uploadbutton,
                ],
              ),
            ),
          ])),
          const Divider(
            height: 100,
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(211, 180, 180, 180),
          ),
          Expanded(
              child: Stack(children: [
            Positioned(
                bottom: 90.0,
                child: Column(children: <Widget>[
                  Text(
                    _ingredient,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Consola",
                    ),
                  ),
                ])),
            Positioned(
              bottom: 30.0,
              right: 90.0,
              left: 90.0,
              child: Column(
                children: <Widget>[
                  //Declaring sizes of field boxes
                  _nextbutton,
                  const SizedBox(
                    height: 3.0,
                  ),
                ],
              ),
            ),
          ]))
        ]),
      ),
    );
  }
}
