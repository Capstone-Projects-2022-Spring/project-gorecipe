import 'package:flutter/material.dart';
import 'package:gorecipe/Models/Ingredient.dart';
import '../Models/Recipe.dart';
import '../Models/Ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:gorecipe/Screens/Components/hero_dialog_route.dart';
import 'package:gorecipe/Screens/recipe_display_card.dart';
import 'dart:convert';

class RecipePopupCard extends StatelessWidget {
  const RecipePopupCard({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    List<String> instructions = Recipe.instructionsToList(recipe.content);
    return Hero(
      tag: recipe.name,
      // createRectTween: (begin, end) {
      //   return CustomRectTween(begin: begin, end: end);
      // },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Title
                      _RecipeTitle(title: recipe.name),
                      const SizedBox(
                        height: 8,
                      ),
                      //Image Stack
                      Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            height: 300.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: FractionalOffset.center,
                                image: NetworkImage(recipe.imageURL),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 260),
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.width * 0.20,
                            child: Material(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(30.0),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Total Time",
                                        style: TextStyle(fontSize: 14),
                                        maxLines: 1,
                                        textAlign: TextAlign.center),
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Calories",
                                        style: TextStyle(fontSize: 14),
                                        maxLines: 1,
                                        textAlign: TextAlign.center),
                                  ),
                                  VerticalDivider(
                                    color: Colors.black,
                                    thickness: 2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Difficulty",
                                        style: TextStyle(fontSize: 14),
                                        maxLines: 1,
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      //Ingredient List
                      if (recipe.ingredients != null) ...[
                        const Divider(),
                        _RecipeItemsBox(
                          ingredients: recipe.ingredients,
                        )
                      ],
                      Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: instructions.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Row(children: [
                                Flexible(
                                    child: Text((index + 1).toString() +
                                        ") " +
                                        instructions[index])),
                              ]);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RecipeTitle extends StatelessWidget {
  /// {@macro Recipe_title}
  const _RecipeTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}

/// {@template Recipe_items_box}
/// Box containing the list of a [Recipe]'s items.
///
/// These items can be checked.
/// {@endtemplate}
class _RecipeItemsBox extends StatelessWidget {
  /// {@macro Recipe_items_box}
  const _RecipeItemsBox({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  final List ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in ingredients) _RecipeItemTile(item: item),
      ],
    );
  }
}

/// {@template Recipe_item_template}
/// An individual [Recipe] [Item] with its [Checkbox].
/// {@endtemplate}
class _RecipeItemTile extends StatefulWidget {
  /// {@macro Recipe_item_template}
  const _RecipeItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  _RecipeItemTileState createState() => _RecipeItemTileState();
}

class _RecipeItemTileState extends State<_RecipeItemTile> {
  void _onChanged(bool? val) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: _onChanged,
        value: false,
      ),
      title: Text(widget.item),
    );
  }
}
