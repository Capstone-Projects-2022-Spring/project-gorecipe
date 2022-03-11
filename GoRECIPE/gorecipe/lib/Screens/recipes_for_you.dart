import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    const headerText = Text(
      "Recipes For You",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    List<String> recipes = [
      "test",
      "test2",
      "test",
      "test2",
      "test",
      "test2",
      "test",
      "test2"
    ];

    final listRecipes = ListView.builder(
      itemCount: recipes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          //leading: Icon(Icons.star),
          title: Text(recipes[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const RecipesYou()), //replace with link to recipe's page
            );
          }, //onTap
        );
      },
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
                const SizedBox(height: 10.0),
                headerText,
                const SizedBox(height: 30.0),
                listRecipes
              ],
            ),
          ),
        ),
      ),
    );
  }
}
