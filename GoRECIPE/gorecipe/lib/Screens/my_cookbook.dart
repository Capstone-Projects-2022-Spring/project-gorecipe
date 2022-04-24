import 'package:flutter/material.dart';
import 'package:gorecipe/Models/Ingredient.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:gorecipe/Screens/explore.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/preferences.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Models/Recipe.dart';
import '../Models/Ingredient.dart';
import 'package:http/http.dart' as http;
import 'package:gorecipe/Screens/Components/hero_dialog_route.dart';
import 'package:gorecipe/Screens/recipe_display_card.dart';
import 'dart:convert';
import '../Models/User.dart';
import '../../globals.dart' as globals;
import 'package:gorecipe/Screens/profile.dart';

//linked to the finish scan button on scan page

class CookBook extends StatefulWidget {
  const CookBook({Key? key}) : super(key: key);

  @override
  State<CookBook> createState() => _CookBook();
}

class _CookBook extends State<CookBook> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  late User currentUser;
  List<bool> selected = <bool>[];

  List recipes = <Recipe>[];
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
    getSavedRecipes();
    super.initState();
  }

  Future getSavedRecipes() async {
    var response = await http.get(
      Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' +
          currentUser.id.toString() +
          '/recipes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      List temp = (json.decode(response.body) as List)
          .map((i) => Recipe.fromJson(i))
          .toList();
      setState(() {
        recipes = temp;
      });
    } else {
      print("cannot get data");
    }
  }

  Future deleteRecipe({required int id}) async {
    final response = await http.delete(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' +
            currentUser.id.toString() +
            '/recipes/' +
            id.toString()),
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
  int _currentIndex = 0;

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

  double? Rvalue;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < recipes.length; i++) {
      selected.add(true);
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 163, 126),

      appBar: AppBar(
        title: Text(
          "My CookBook",
          style: TextStyle(color: Color.fromARGB(255, 116, 163, 126)),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 116, 163, 126)),
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
                                        color: Color.fromARGB(255, 50, 71, 55),
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
                                    RatingBar(
                                        initialRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        ratingWidget: RatingWidget(
                                            full: const Icon(Icons.star,
                                                color: Colors.orange),
                                            half: const Icon(
                                              Icons.star_half,
                                              color: Colors.orange,
                                            ),
                                            empty: const Icon(
                                              Icons.star_outline,
                                              color: Colors.orange,
                                            )),
                                        onRatingUpdate: (value) {
                                          setState(() {
                                            Rvalue = value;
                                          });
                                        }),
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
      ),
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
                  //navigation im confused everything is giving me an error
                  //onTap: () => HomeScreen(),

                  // onTap: () {
                  //   Navigator.pop(context);

                  // },
                }),
            ListTile(
                leading: const Icon(Icons.set_meal),
                title: const Text('Set Food Preference'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Preferences(
                                key: ObjectKey('preferences'),
                              )));
                }),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('MyCookBook'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CookBook()));
              },
            ),
            ListTile(
                leading: const Icon(Icons.calendar_today_outlined),
                title: const Text('Calendar'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarPage(
                                key: ObjectKey('calendar page'),
                              )));
                }),
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
      //CREATING THE NEW BOTTOM NAV BAR SO BUTTONS WORK
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ''),
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
    );
  }
}
