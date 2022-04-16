// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/edit_account.dart';
import '../Models/User.dart';
import 'package:http/http.dart' as http;
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import '../../globals.dart' as globals;
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:gorecipe/Screens/preferences.dart';
import 'package:gorecipe/Screens/explore.dart';

// View profile page

class Profile extends StatefulWidget {
  const Profile({required Key key, required this.title}) : super(key: key);

  final String title;
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  late User currentUser;
  //bool isDone = false;
  @override
  void initState() {
    super.initState();
    currentUser = globals.user;
  }

  /*Future getUser({required int userId}) async {
    final response = await http.get(
        Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' +
            userId.toString()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Access-Control-Allow-Origin': '*'
        });

    User user = User.fromJson(jsonDecode(response.body));

    setState(() {
      currentUser = user;
      isDone = true;
    });
  }*/

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

  @override
  Widget build(BuildContext context) {
    /*if (isDone == false) {
      return const CircularProgressIndicator();
    }*/
    final firstName = Text(
      currentUser.firstName,
      textAlign: TextAlign.center,
      textScaleFactor: 3.0,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 50, 71, 55),
      ),
    );
    final lastName = Text(
      currentUser.lastName,
      textAlign: TextAlign.center,
      textScaleFactor: 3.0,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 50, 71, 55),
      ),
    );

    final userName = Text(
      currentUser.username,
      textAlign: TextAlign.center,
      textScaleFactor: 2.25,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color.fromARGB(255, 50, 71, 55),
      ),
    );

    final email = Text(
      currentUser.email,
      textAlign: TextAlign.center,
      textScaleFactor: 2.25,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Color.fromARGB(255, 50, 71, 55),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ACCOUNT',
          style: TextStyle(
            color: Color.fromARGB(255, 116, 163, 126),
          ),
        ),
        backgroundColor: Colors.white,
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
            const ListTile(
              leading: Icon(Icons.book),
              title: Text('MyCookBook'),
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

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(
                    image: const AssetImage("assets/images/ingredients.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(.2), BlendMode.dstATop),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /*Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/default_pfp.png"),
                              fit: BoxFit.fill),
                        ),
                      ),*/
                      const SizedBox(height: 15.0),
                      firstName,
                      lastName,
                      const SizedBox(height: 15.0),
                      userName,
                      email,
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.book,
                          color: Color.fromARGB(255, 91, 128, 99),
                        ),
                        Text('    MyCookbook',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.justify,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                              color: Color.fromARGB(255, 91, 128, 99),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CalendarPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.wysiwyg_rounded,
                          color: Color.fromARGB(255, 91, 128, 99),
                        ),
                        Text('    Calendar',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.justify,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color.fromARGB(255, 91, 128, 99))),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Preferences()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.wifi_protected_setup,
                          color: Color.fromARGB(255, 91, 128, 99),
                        ),
                        Text('    Update Food Preferences',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.justify,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color.fromARGB(255, 91, 128, 99))),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditAccount()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.app_settings_alt,
                          color: Color.fromARGB(255, 91, 128, 99),
                        ),
                        Text('    Edit Profile',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.justify,
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color.fromARGB(255, 91, 128, 99))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //CREATING THE NEW BOTTOM NAV BAR SO BUTTONS WORK

      bottomNavigationBar: BottomNavigationBar(
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
