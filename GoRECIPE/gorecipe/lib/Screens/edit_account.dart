import 'dart:io';

import 'package:flutter/material.dart';
import '../Models/User.dart';
import '../../globals.dart' as globals;
import 'package:gorecipe/Screens/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/preferences.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/explore.dart';

//linked to the edit account button on profile page

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccount();
}

class _EditAccount extends State<EditAccount> {
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

  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  late User currentUser;
  late Map<String, dynamic> userMap;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentUser = globals.user;
  }

  Future<User> patchUser(
      {required String usernamechange, required String emailchange}) async {
    final response = await http.patch(
      Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' +
          currentUser.id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.contentTypeHeader: 'application/json',
        'Access-Control-Allow-Origin': '*'
      },
      body: jsonEncode(<String, String>{
        'username': usernamechange,
        'email': emailchange,
      }),
    );
    print(response.body);
    return User.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    /*final profileButton = IconButton(
      icon: Image.asset('assets/images/default_pfp.png'),
      iconSize: 200,
      onPressed: () {},
    );*/

    final usernameField = TextField(
      controller: usernameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: currentUser.username,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))),
    );

    final editButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            if (usernameController.text != "") {
              currentUser.username = usernameController.text;
            } else {
              usernameController.text = currentUser.username;
            }
            if (emailController.text != "") {
              currentUser.email = emailController.text;
            } else {
              emailController.text = currentUser.email;
            }
            patchUser(
                usernamechange: usernameController.text,
                emailchange: emailController.text);
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(
                      key: GlobalKey(),
                      title: "Profile",
                    )),
          );
        },
        child: Text("Finish",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EDIT ACCOUNT',
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Declaring sizes of field boxes
                  const SizedBox(height: 200.0),
                  //profileButton,
                  const SizedBox(height: 25.0),
                  usernameField,
                  const SizedBox(height: 25.0),
                  emailField,
                  const SizedBox(
                    height: 35.0,
                  ),
                  editButton,
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

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
