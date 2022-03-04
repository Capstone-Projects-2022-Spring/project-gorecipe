import 'package:flutter/material.dart';

// Search by Ingredient page

class SearchByIngredient extends StatefulWidget {
  //const Profile({Key? key}) : super(key: key);
  const SearchByIngredient({required Key key, required this.title})
      : super(key: key);

  final String title;
  @override
  State<SearchByIngredient> createState() => _SearchByIngredient();
}

class _SearchByIngredient extends State<SearchByIngredient> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: const [
              Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "SEARCH BY INGREDIENT",
                            textScaleFactor: 2.25,
                            style: TextStyle(
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                  )
              )
            ],
          ),
        ),
    );
  }
}