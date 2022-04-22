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
import '../Models/User.dart';
import '../Models/FoodImage.dart';
import '../../globals.dart' as globals;

class UnknownIngredientScreen extends StatefulWidget {
  const UnknownIngredientScreen(
      {Key? key,
      required this.imagePath,
      required this.ingredientList,
      required this.imageId,
      required this.network})
      : super(key: key);
  final TextStyle style =
      const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final String imagePath;
  final List<dynamic> ingredientList;
  final String imageId;
  final bool network;
  UnknownIngredientState createState() => UnknownIngredientState();
}

class UnknownIngredientState extends State<UnknownIngredientScreen> {
  var _foundIngredient = false;
  String _ingredient = "";
  List ingredients = <String>[];
  bool uploaded = false;
  List ingredientList = <String>[];
  late User currentUser;

  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    currentUser = globals.user;
  }

  final addIngredientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ingredientList = widget.ingredientList;

    submitList() async {
      final response = await http.post(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/images/' +
            widget.imageId),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(ingredientList),
      );

      print(jsonEncode(ingredientList));

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
    final addIngredientField = SizedBox(
      width: 145.0,
      child: TextField(
        controller: addIngredientController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 116, 163, 126),
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Add Here",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
      ),
    );

    final _submitbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 5,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          if (ingredientList.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cannot Send Empty List")));
          } else {
            submitList();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RecipesYou(ingredientList: ingredientList, choice: 1)),
            );
          }
        },
        child: Text("Submit List",
            textAlign: TextAlign.center,
            style: widget.style.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15)),
      ),
    );

    final _addButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 5,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          setState(() {
            widget.ingredientList.add(addIngredientController.text);
          });
        },
        child: Text("Add",
            textAlign: TextAlign.center,
            style: widget.style.copyWith(
                color: Color.fromARGB(255, 116, 163, 126),
                fontWeight: FontWeight.w500,
                fontSize: 15)),
      ),
    );

    final _addText = Text("Swipe to Dismiss or Add using the textfield",
        textAlign: TextAlign.center,
        style: widget.style.copyWith(
            color: Color.fromARGB(255, 116, 163, 126),
            fontWeight: FontWeight.w500,
            fontSize: 15));

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
              if (!widget.network) ...{
                Image.file(File(widget.imagePath)),
              } else ...{
                Image.network(widget.imagePath),
              },
              const SizedBox(height: 40),
              _addText,
              Row(
                children: [
                  addIngredientField,
                  const SizedBox(width: 20),
                  _addButton,
                  const SizedBox(width: 20),
                  _submitbutton,
                ],
              ),
              const SizedBox(height: 40),
              RemoveableList(ingredientList: ingredientList),

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
