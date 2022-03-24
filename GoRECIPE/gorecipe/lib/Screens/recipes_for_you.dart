import 'package:flutter/material.dart';
import '../Models/Recipe.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//linked to the finish scan button on scan page

class RecipesYou extends StatefulWidget {
  const RecipesYou({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<RecipesYou> createState() => _RecipesYou();
}

class _RecipesYou extends State<RecipesYou> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  List<bool> selected = <bool>[];

  List<Recipe> recipes = <Recipe>[];

  Recipe recipe1 = const Recipe(
      id: 0,
      content: "60 minutes",
      ingredients: "apple",
      name: "apple pie",
      videoURL: "youtube.com");
  Recipe recipe2 = const Recipe(
      id: 1,
      content: "65 minutes",
      ingredients: "pumpkin",
      name: "pumpkin pie",
      videoURL: "youtube.com");

  @override
  initState() {
    recipes.add(recipe1);
    recipes.add(recipe2);
    super.initState();
  }

  Future recipe({required int id}) async {
    final response = await http.get(
        Uri.parse(
            'http://gorecipe.us-east-2.elasticbeanstalk.com/api/recipes/' +
                id.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*'
        });
  }

  Image firstImage = const Image(
    image: AssetImage('images/star.png'),
    width: 20,
    height: 20,
    fit: BoxFit.cover,
    color: null,
  );

  Image secondImage = const Image(
    image: AssetImage('images/unstar.png'),
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
            return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: index == 0
                      ? const Border() // This will create no border for the first item
                      : Border(
                          top: BorderSide(
                              width: 1,
                              color: Theme.of(context)
                                  .primaryColor)), // This will create top borders for the rest
                ),
                child: ListTile(
                    title: Text(recipes[index].name),
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
                              selected[index] = !selected.elementAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecipesYou()),
                        )));
          },
        ),
      ),
    );
  }
}
