import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/recipes_for_you.dart';
import 'package:gorecipe/Screens/my_cookbook.dart';
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

class Explore extends StatefulWidget {
  //const Profile({Key? key}) : super(key: key);
  const Explore({required Key key, required this.title}) : super(key: key);

  final String title;
  @override
  State<Explore> createState() => _Explore();
}

class _Explore extends State<Explore> {
  int _currentIndex = 0;

  List<Recipe> quickList = <Recipe>[];
  List<Recipe> veganList = <Recipe>[];
  List<Recipe> breakfastList = <Recipe>[];
  List<Recipe> dinnerList = <Recipe>[];
  Map<String, dynamic> superList = {};

  final _children = [
    HomeScreen(),
    Explore(key: ObjectKey('welcome page'), title: 'hi'),
    ScanHomeScreen(),
    Profile(key: ObjectKey('welcome page'), title: 'profile')
  ];

  _onTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            _children[_currentIndex])); // this has changed
  }

  Future getRecipesByExplore() async {
    var response = await http.get(
      Uri.parse(
          'http://gorecipe.us-east-2.elasticbeanstalk.com/api/recipes/explore'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
    );
    if (response.statusCode == 200) {
      //print(jsonDecode(response.body));
      superList = jsonDecode(response.body);

      quickList =
          (superList["quick"] as List).map((i) => Recipe.fromJson(i)).toList();

      veganList =
          (superList["vegan"] as List).map((i) => Recipe.fromJson(i)).toList();

      breakfastList = (superList["breakfast"] as List)
          .map((i) => Recipe.fromJson(i))
          .toList();

      dinnerList =
          (superList["dinner"] as List).map((i) => Recipe.fromJson(i)).toList();

      setState(() {});
    } else {
      // ignore: avoid_print
      throw Exception("Cannot get data" + response.statusCode.toString());
    }
  }

  @override
  initState() {
    getRecipesByExplore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     'EXPLORE',
        //     style: TextStyle(
        //       color: Color.fromARGB(255, 116, 163, 126),
        //     ),
        //   ),
        //   backgroundColor: Colors.white,
        // ),

        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 116, 163, 126),
                ),
                child: Text(
                  'GoRecipe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                                  key: ObjectKey('welcome page'),
                                )));

                    //idk why this isnt working
                    //   navigation im confused everything is giving me an error
                    // onTap: () => HomeScreen(),

                    //   onTap: () {
                    //   Navigator.pop(context);

                    //},
                  }),
              const ListTile(
                leading: Icon(Icons.set_meal),
                title: Text('Set Food Preference'),
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('MyCookBook'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CookBook()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.calendar_today_outlined),
                title: Text('Calendar'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Profile(
                              key: ObjectKey('profile page'),
                              title: 'profile page')));
                },
              ),
              const ListTile(
                leading: Icon(Icons.help_center),
                title: Text('Help'),
              ),
              // putting the scan oon the dropdown menu for now

              ListTile(
                  leading: const Icon(Icons.camera),
                  title: const Text('Scan'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScanHomeScreen(
                                  key: ObjectKey(
                                      'want to add this an ingredient?'),
                                )));
                  }),

              ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(
                                key: ObjectKey('welcome page'),
                                title: 'welcome page')));
                  }),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: const Text(
                  'EXPLORE',
                  style: TextStyle(
                    color: Color.fromARGB(255, 116, 163, 126),
                  ),
                ),
                backgroundColor: Colors.white,
                pinned: true,
                floating: true,
                iconTheme:
                    IconThemeData(color: Color.fromARGB(255, 116, 163, 126)),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                        child: Text(
                      'Reccomended',
                      style: TextStyle(
                        color: Color.fromARGB(255, 116, 163, 126),
                      ),
                    )),
                    Tab(
                        child: Text(
                      'Quick',
                      style: TextStyle(
                        color: Color.fromARGB(255, 116, 163, 126),
                      ),
                    )),
                    Tab(
                        child: Text(
                      'Vegan',
                      style: TextStyle(
                        color: Color.fromARGB(255, 116, 163, 126),
                      ),
                    )),
                    Tab(
                        child: Text(
                      'Breakfast',
                      style: TextStyle(
                        color: Color.fromARGB(255, 116, 163, 126),
                      ),
                    )),
                    Tab(
                        child: Text(
                      'Dinner',
                      style: TextStyle(
                        color: Color.fromARGB(255, 116, 163, 126),
                      ),
                    )),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              RecipesYou(ingredientList: [], choice: 2, recipeList: []),
              RecipesYou(
                  ingredientList: ["quick"], choice: 3, recipeList: quickList),
              RecipesYou(
                  ingredientList: ["vegan"], choice: 3, recipeList: veganList),
              RecipesYou(
                  ingredientList: ["breakfast"],
                  choice: 3,
                  recipeList: breakfastList),
              RecipesYou(
                  ingredientList: ["dinner"],
                  choice: 3,
                  recipeList: dinnerList),
            ],
          ),
        ),

        //CREATING THE NEW BOTTOM NAV BAR SO BUTTONS WORK

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 30), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera, size: 30), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded, size: 30), label: ''),
          ],
          selectedItemColor: Colors.black,
          elevation: 5.0,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _onTap();
          },
        ),
      ),
    );
  }
}
