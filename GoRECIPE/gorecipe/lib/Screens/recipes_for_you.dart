// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:gorecipe/Models/Ingredient.dart';
import 'package:gorecipe/Screens/event_editing.dart';
import '../Models/Recipe.dart';
import '../Models/Ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:gorecipe/Screens/Components/hero_dialog_route.dart';
import 'package:gorecipe/Screens/recipe_display_card.dart';
import 'dart:convert';

//import 'package:shared_preferences/shared_preferences.dart';

//linked to the finish scan button on scan page

class RecipesYou extends StatefulWidget {
  const RecipesYou({Key? key, required this.ingredientList}) : super(key: key);

  final List<dynamic> ingredientList;

  @override
  State<RecipesYou> createState() => _RecipesYou();
}

class _RecipesYou extends State<RecipesYou> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  List<bool> selected = <bool>[];

  List recipes = <Recipe>[];

  late DateTime? fromDate;

  Future getRecipesBySearch() async {
    var response = await http.get(
      Uri.parse(
          'http://gorecipe.us-east-2.elasticbeanstalk.com/api/recipes/search?query=' +
              widget.ingredientList[0].toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
    );
    //print(response.body);
    if (response.statusCode == 200) {
      List temp = (json.decode(response.body) as List)
          .map((i) => Recipe.fromJson(i))
          .toList();
      setState(() {
        recipes = temp;
      });
    } else {
      // ignore: avoid_print
      print("cannot get data");
    }
  }

  @override
  initState() {
    getRecipesBySearch();
    super.initState();
  }

  Future getRecipe({required int id}) async {
    final response = await http.get(
        Uri.parse(
            'http://gorecipe.us-east-2.elasticbeanstalk.com/api/recipes/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*'
        });
  }

  Image firstImage = const Image(
    image: AssetImage('assets/images/star.png'),
    width: 20,
    height: 20,
    fit: BoxFit.cover,
    color: null,
  );

  Image secondImage = const Image(
    image: AssetImage('assets/images/unstar.png'),
    width: 20,
    height: 20,
    fit: BoxFit.cover,
    color: null,
  );

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < recipes.length; i++) {
      selected.add(false);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  HeroDialogRoute(
                    builder: (context) => Center(
                      child: RecipePopupCard(
                        recipe: recipes[index],
                      ),
                    ),
                  ),
                );
              },
              child: Hero(
                tag: recipes[index].name,
                child: Material(
                  child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: index == 0
                            ? const Border() // This will create no border for the first item
                            : Border(
                                top: BorderSide(
                                    width: 1,
                                    color: Theme.of(context)
                                        .primaryColor)), // This will create top borders for the rest
                      ),
                      child: Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.network(recipes[index].imageURL),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  IconButton(
                                    icon: selected.elementAt(index)
                                        ? firstImage
                                        : secondImage,
                                    iconSize: 200,
                                    onPressed: () {
                                      //save to My Cookbook
                                      setState(() {
                                        selected[index] =
                                            !selected.elementAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: selected.elementAt(index)
                                  ? const Icon(Icons.check_box_sharp)
                                  : const Icon(Icons.calendar_today_outlined),
                              onPressed: () {
                                selected[index] = !selected.elementAt(index);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const EventEditingPage()));
                              },
                            ),
                            const SizedBox(height: 10),
                            Text(recipes[index].name),
                          ],
                        ),
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
