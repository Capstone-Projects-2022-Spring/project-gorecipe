// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:gorecipe/Models/Ingredient.dart';
import 'package:gorecipe/Screens/event_editing.dart';
import 'package:gorecipe/Screens/home_screen.dart';
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

class RecipesYou extends StatefulWidget {
  const RecipesYou(
      {Key? key,
      required this.ingredientList,
      required this.choice,
      required this.recipeList})
      : super(key: key);

  final List<dynamic> ingredientList;
  final List<Recipe> recipeList;
  final int choice;

  @override
  State<RecipesYou> createState() => _RecipesYou();
}

class _RecipesYou extends State<RecipesYou> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  bool _found = false;

  bool _visible = false;

  List<bool> selected = <bool>[];

  List recipes = <Recipe>[];

  late DateTime? fromDate;

  late User currentUser;

  Future getRecipesBySearch() async {
    var response = await http.get(
      Uri.parse(
          'http://gorecipe.us-east-2.elasticbeanstalk.com/api/recipes/search?ingredients=' +
              widget.ingredientList.join(',') +
              "&query=food"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
    );
    // print(
    //     'http://gorecipe.us-east-2.elasticbeanstalk.com/api/recipes/search?ingredients=' +
    //         widget.ingredientList.join(',') +
    //         "&query=food");
    //print(response.body);
    if (response.statusCode == 200) {
      List temp = (json.decode(response.body) as List)
          .map((i) => Recipe.fromJson(i))
          .toList();
      setState(() {
        recipes = temp;
        _found = true;
      });
    } else {
      // ignore: avoid_print
      throw Exception("Cannot get data" + response.statusCode.toString());
    }
  }

  Future saveRecipe({required int id}) async {
    final response = await http.post(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' +
            currentUser.id.toString() +
            '/recipes/' +
            id.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*'
        });
    print(currentUser.id);
    print(id);
  }

  @override
  initState() {
    currentUser = globals.user;
    if (widget.choice == 1) {
      getRecipesBySearch();
    } else if (widget.choice == 2) {
      getRandomRecipes(id: currentUser.id);
    } else {
      recipes = widget.recipeList;
      _found = true;
    }
    super.initState();
  }

  Future getRandomRecipes({required int id}) async {
    var response = await http.get(
      Uri.parse(
          'http://gorecipe.us-east-2.elasticbeanstalk.com/api/recipes/recommend/' +
              id.toString()),
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
        _found = true;
      });
    } else {
      // ignore: avoid_print
    }
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
    if (widget.choice == 1) {
      _visible = true;
    } else {
      _visible = false;
    }
    if (!_found) {
      return Scaffold(
          appBar: _visible
              ? AppBar(
                  title: Text("Recipes"),
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

    for (var i = 0; i < recipes.length; i++) {
      selected.add(false);
    }

    if (recipes.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Recipes"),
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
              Text("No Recipes Found Try again with smaller search parameters"),
            ],
          ));
    }

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 116, 163, 126),
        appBar: _visible
            ? AppBar(
                title: Text("Recipes"),
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
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
              ),
            ),
            ListView.builder(
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
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 116, 163, 126),
                            border: index == 0
                                ? const Border() // This will create no border for the first item
                                : Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: Color.fromARGB(255, 50, 71,
                                            55))), // This will create top borders for the rest
                          ),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Positioned(
                                    left: 300,
                                    child: Column(children: <Widget>[
                                      Text(
                                        recipes[index].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 50, 71, 55),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                                ListTile(
                                  leading: /*Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0, 10.0)
                                      ..scale(1.5),
                                    child:*/
                                      ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      recipes[index].imageURL,
                                      scale: 0.5,
                                      fit: BoxFit.fill,
                                    ),
                                    //  ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      IconButton(
                                        icon: selected.elementAt(index)
                                            ? firstImage
                                            : secondImage,
                                        onPressed: () {
                                          setState(() {
                                            saveRecipe(id: recipes[index].id);
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: selected.elementAt(index)
                                            ? const Icon(Icons.check_box_sharp)
                                            : const Icon(
                                                Icons.calendar_today_outlined),
                                        onPressed: () {
                                          selected[index] =
                                              !selected.elementAt(index);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EventEditingPage()));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                );
              },
            ),
          ]),
        ));
  }
}
