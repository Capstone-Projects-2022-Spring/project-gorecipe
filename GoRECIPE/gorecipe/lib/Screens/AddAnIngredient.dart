// ignore_for_file: unused_field, file_names, unused_element, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:gorecipe/Screens/my_cookbook.dart';
// ignore: unused_import

// import 'package:gorecipe/Screens/forgot_password.dart';
//import 'package:gorecipe/Screens/forgot_password.dart';
//import 'package:gorecipe/Screens/forgot_password.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/scan_option.dart';
import 'package:gorecipe/Screens/scan_screen.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
//import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/welcome_screen.dart';

// ignore: unused_import
import 'package:gorecipe/Screens/bottom_nav_bar.dart';

import 'package:gorecipe/Screens/preferences.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/scanlookup_ingredient.dart';

//import 'package:gorecipe/Screens/welcome_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'GoRecipe';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: AddAnIngredient(),
    );
  }
}

class AddAnIngredient extends StatefulWidget {
  const AddAnIngredient({Key? key}) : super(key: key);
  @override
  State<AddAnIngredient> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<AddAnIngredient> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final style = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Scan',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Next = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 82, 146, 26),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          Navigator.push(
            context,
            //Until creating the recipe page
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Text("Next",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20)),
      ),
    );
    final ScanLookupB = Material(
        child: Stack(children: [
      InkWell(
        splashColor: Colors.green,
        onTap: () {},
        child: Column(
          children: [
            IconButton(
              icon: Image.asset("assets/images/AddAnIngredientButton.PNG"),
              iconSize: 450,
              onPressed: () {
                Navigator.push(
                  context,
                  //Change it to the scan lookup page
                  MaterialPageRoute(builder: (context) => const ScanScreen()),
                );
              },
            ),
          ],
        ),
      ),
    ]));

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'SCAN',
            style: TextStyle(color: Color.fromARGB(255, 116, 163, 126)),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 116, 163, 126)),
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
                    //   navigation im confused everything is giving me an error
                    // onTap: () => HomeScreen(),

                    //   onTap: () {
                    //   Navigator.pop(context);

                    //},
                  }),
              ListTile(
                leading: const Icon(Icons.set_meal),
                title: const Text('Set Food Preference'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Preferences()));
                },
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('MyCookBook'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CookBook()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today_outlined),
                title: const Text('Calendar'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarPage()));
                },
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
        body: Center(
          child: Stack(children: [
            Positioned(
                top: 50.0,
                left: 20.0,
                child: Column(children: const <Widget>[
                  Text(
                    "ADD AN INGREDIENT",
                    textAlign: TextAlign.left,
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontFamily: "Consola",
                    ),
                  ),
                ])),
            Positioned(
              left: 5,
              bottom: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(),
                  ScanLookupB,
                  const SizedBox(),
                ],
              ),
            ),
            Positioned(
                bottom: 50.0,
                right: 140.0,
                left: 140.0,
                child: Column(
                  children: <Widget>[
                    //Declaring sizes of field boxes
                    Next,
                    const SizedBox(
                      height: 3.0,
                    ),
                  ],
                ))
          ]),
        ));
  }
}
//The second scan page
