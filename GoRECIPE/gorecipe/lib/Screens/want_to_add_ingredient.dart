// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/my_cookbook.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'GoRecipe';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: WantToAdd(
        title: '',
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class WantToAdd extends StatefulWidget {
  const WantToAdd({Key? key, required String title}) : super(key: key);
  @override
  State<WantToAdd> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<WantToAdd> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final style = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    final NO = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromARGB(255, 116, 163, 126),
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
        child: Text("NO",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.w500)),
      ),
    );
    final YES = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromARGB(255, 116, 163, 126),
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
        child: Text("YES",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.w500)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'CALENDAR',
            style: TextStyle(color: Color.fromARGB(255, 116, 163, 126)),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 116, 163, 126)),
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
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
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
              ListTile(
                  leading: Icon(Icons.help_center),
                  title: Text('Help'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(
                                key: ObjectKey('welcome page'),
                                title: 'welcome page')));
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
                top: 30.0,
                left: 10.0,
                child: Column(children: const <Widget>[
                  Text(
                    "INGREDIENT",
                    textAlign: TextAlign.left,
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Consola",
                    ),
                  ),
                ])),
            Positioned(
                top: 120.0,
                left: 10.0,
                right: 10.0,
                child: Column(children: const <Widget>[
                  Text(
                    "DO YOU WANT TO ADD\n   INGREDIENT NAME?",
                    textAlign: TextAlign.left,
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      color: Color.fromARGB(255, 116, 163, 126),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Consola",
                    ),
                  ),
                ])),
            Positioned(
              left: 40,
              right: 40,
              bottom: 300,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: const Image(
                      image: AssetImage("assets/images/WantToAdd.PNG"),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 150.0,
                right: 90.0,
                left: 90.0,
                child: Column(
                  children: <Widget>[
                    YES,
                    const SizedBox(
                      height: 3.0,
                    ),
                  ],
                )),
            Positioned(
                bottom: 70.0,
                right: 90.0,
                left: 90.0,
                child: Column(
                  children: <Widget>[
                    NO,
                    const SizedBox(
                      height: 3.0,
                    ),
                  ],
                ))
          ]),
        ));
  }
}
