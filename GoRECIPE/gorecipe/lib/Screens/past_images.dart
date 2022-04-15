// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:gorecipe/Models/FoodImage.dart';
import 'package:gorecipe/Models/Ingredient.dart';
import 'package:gorecipe/Screens/event_editing.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/unknown_ingredient.dart';
import '../Models/Recipe.dart';
import '../Models/Ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:gorecipe/Screens/Components/hero_dialog_route.dart';
import 'package:gorecipe/Screens/recipe_display_card.dart';
import 'dart:convert';
import '../Models/User.dart';
import '../../globals.dart' as globals;
//import 'package:shared_preferences/shared_preferences.dart';

//linked to the finish scan button on scan page

class PastImages extends StatefulWidget {
  const PastImages({
    Key? key,
  }) : super(key: key);

  @override
  State<PastImages> createState() => _PastImages();
}

class _PastImages extends State<PastImages> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  bool _found = false;

  bool _visible = false;

  List<bool> selected = <bool>[];

  List foodImages = <FoodImage>[];

  List images = <String>[];

  List<dynamic> ingList = <dynamic>[];

  late DateTime? fromDate;

  late User currentUser;

  @override
  initState() {
    currentUser = globals.user;
    getUserImages(id: currentUser.id);
    super.initState();
  }

  Future getUserImages({required int id}) async {
    var response = await http.get(
      Uri.parse(
          'http://gorecipe.us-east-2.elasticbeanstalk.com/api/images/user/' +
              id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
    );
    //print(response.body);
    if (response.statusCode == 200) {
      List temp = (json.decode(response.body) as List)
          .map((i) => FoodImage.fromJson(i))
          .toList();
      setState(() {
        foodImages = temp;
        _found = true;
        _visible = true;
        foodImages
            .forEach((foodImage) => getFoodImage(id: foodImage.s3objectId));
      });
    } else {
      throw Exception("Couldnt get food image list from user" +
          response.statusCode.toString());
    }
  }

  Future getFoodImage({required String id}) async {
    var response = await http.get(
      Uri.parse(
          'http://gorecipe.us-east-2.elasticbeanstalk.com/api/images/' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
    );
    //print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        images.add(response.body);
      });
    } else {
      // ignore: avoid_print
      throw Exception(" Unable to get food image src");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_found) {
      return Scaffold(
          appBar: _visible
              ? AppBar(
                  title: Text("Past Images"),
                  automaticallyImplyLeading: false,
                  backgroundColor: const Color.fromARGB(255, 116, 163, 126),
                  leading: IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen(
                                    key: ObjectKey('welcome page'),
                                  )));
                    },
                  ),
                )
              : null,
          body: const CircularProgressIndicator());
    }

    if (foodImages.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Past Images"),
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 116, 163, 126),
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                              key: ObjectKey('welcome page'),
                            )));
              },
            ),
          ),
          body: Column(
            children: [
              SizedBox(height: 20),
              Text("No Images Found Upload images to see them here"),
            ],
          ));
    }

    return Scaffold(
      appBar: _visible
          ? AppBar(
              title: Text("Past Images"),
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 116, 163, 126),
              leading: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen(
                                key: ObjectKey('welcome page'),
                              )));
                },
              ),
            )
          : null,
      body: GridView.count(
        // crossAxisCount is the number of columns
        crossAxisCount: 2,
        // This creates two columns with two items in each column
        children: List.generate(
          images.length,
          (index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UnknownIngredientScreen(
                          imagePath: images[index],
                          ingredientList: foodImages[index].imageOf,
                          imageId: foodImages[index].s3objectId,
                          network: true),
                    ),
                  );
                },
                child: Container(
                  child: Image.network(images[index]),
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
