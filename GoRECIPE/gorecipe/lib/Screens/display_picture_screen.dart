import 'dart:async';
import 'dart:io';
// ignore: unused_import
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gorecipe/Models/Ingredient.dart';
import 'package:gorecipe/Screens/recipes_for_you.dart';
import 'package:gorecipe/Screens/unknown_ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import '../Models/User.dart';
import '../Models/FoodImage.dart';
import '../../globals.dart' as globals;

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
  bool uploaded = false;
  List ingredientList = <String>[];
  late User currentUser;
  late FoodImage fImage;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    currentUser = globals.user;
  }

  @override
  Widget build(BuildContext context) {
    upload(File img) async {
      var postUri = Uri.parse(
          "http://gorecipe.us-east-2.elasticbeanstalk.com/api/images/upload/" +
              currentUser.id.toString());
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
      fImage = FoodImage.fromJson(json);
      //print("FOOD IMAGE");
      // print(fImage.imageOf);
      print(fImage.s3objectId);
      // User user1 = fImage.uploadedBy;
      // print(user1);
      setState(() {
        print(jsonEncode(fImage.imageOf));
        ingredients = fImage.imageOf;
        ingredientList = ingredients;
        // print(ingredientList.join(','));
        uploaded = true;
        // print(ingredients);
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

    submitList() async {
      final response = await http.post(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/images/' +
            fImage.s3objectId),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(ingredients),
      );

      //print("HEREERERERE");
      print(jsonEncode(ingredients));
      print(ingredients);

      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception(
            'Failed to send list.' + response.statusCode.toString());
      }
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

    final _swipeText = Text("Swipe to Dismiss Ingredients",
        textAlign: TextAlign.center,
        style: widget.style.copyWith(
            color: Color.fromARGB(255, 116, 163, 126),
            fontWeight: FontWeight.w500,
            fontSize: 15));

    final _nextbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 5,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          if (ingredients.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Upload Image First")));
          } else {
            print(ingredients);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecipesYou(
                        ingredientList: ingredients,
                        choice: 1,
                        recipeList: [],
                      )),
            );
          }
        },
        child: Text("Next",
            textAlign: TextAlign.center,
            style: widget.style.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15)),
      ),
    );
    final _uploadbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 5,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          upload(File(widget.imagePath));
          //getData();
        },
        child: Text("Upload",
            textAlign: TextAlign.center,
            style: widget.style.copyWith(
                color: Color.fromARGB(255, 116, 163, 126),
                fontWeight: FontWeight.w500,
                fontSize: 15)),
      ),
    );

    final _unknownIngredientButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 5,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          if (!uploaded) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Upload Image First")));
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UnknownIngredientScreen(
                  ingredientList: fImage.imageOf,
                  imagePath: widget.imagePath,
                  imageId: fImage.s3objectId,
                  network: false,
                ),
              ),
            );
          }
        },
        child: Text("Ingredient Not Here",
            textAlign: TextAlign.center,
            style: widget.style.copyWith(
                color: Color.fromARGB(255, 116, 163, 126),
                fontWeight: FontWeight.w500,
                fontSize: 15)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Display the Picture'),
        backgroundColor: const Color.fromARGB(255, 116, 163, 126),
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.file(File(widget.imagePath)),
              const SizedBox(height: 40),
              Row(
                children: [
                  //const SizedBox(width: 40),
                  _nextbutton,
                  const SizedBox(width: 10),
                  _uploadbutton,
                  const SizedBox(width: 10),
                  //_unknownIngredientButton
                ],
              ),
              const SizedBox(height: 40),
              if (uploaded) ...[
                const Divider(),
                _swipeText,
                RemoveableList(ingredientList: ingredientList),
              ],

              // Text(_ingredient,
              //     textAlign: TextAlign.center,
              //     style: widget.style.copyWith(
              //         color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

class RemoveableList extends StatefulWidget {
  const RemoveableList({Key? key, required this.ingredientList})
      : super(key: key);

  final List<dynamic> ingredientList;
  @override
  State<RemoveableList> createState() => _RemoveableListState();
}

class _RemoveableListState extends State<RemoveableList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: widget.ingredientList.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.green,
            ),
            key: UniqueKey(),
            onDismissed: (DismissDirection direction) {
              setState(() {
                widget.ingredientList.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(
                widget.ingredientList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
