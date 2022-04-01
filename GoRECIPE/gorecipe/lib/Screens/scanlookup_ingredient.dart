// ignore_for_file: unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:gorecipe/Screens/preferences.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/scan_screen.dart';
import 'package:gorecipe/Screens/search_by_ingredient.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/create_account.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/profile.dart';

class ScanLookup extends StatefulWidget {
  const ScanLookup({Key? key}) : super(key: key);

  @override
  State<ScanLookup> createState() => _ScanLookup();
}

class _ScanLookup extends State<ScanLookup> {
  // ignore: unused_field
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final style = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  // ignore: unused_field
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
    const scanText = Text(
      "Scan Ingredient",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    final scanButton = Material(
        child: Stack(children: [
      InkWell(
        splashColor: Colors.green,
        onTap: () {},
        child: Column(
          children: [
            IconButton(
              icon: Image.asset("assets/images/scanbutton.PNG"),
              iconSize: 300,
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

    final lookupButton = Material(
        child: Stack(children: [
      InkWell(
        splashColor: Colors.green,
        onTap: () {},
        child: Column(
          children: [
            IconButton(
              icon: Image.asset("assets/images/lookupbutton.PNG"),
              iconSize: 300,
              onPressed: () {
                Navigator.push(
                    context,
                    //Change it to the scan lookup page
                    MaterialPageRoute(
                        builder: (context) => const SearchByIngredient(
                              key: ObjectKey('search'),
                              title: 'title',
                            ))
                    //MaterialPageRoute(
                    //  builder: (context) => const WantToAdd(
                    //    key: ObjectKey(ScanLookup()),
                    //  title: "Add Ingredient")),
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
          'ADD INGREDIENT',
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
                color: Colors.green,
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
                leading: const Icon(Icons.help_center),
                title: const Text('Help'),
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

      //CREATING THE NEW BOTTOM NAV BAR SO BUTTONS WORK
      bottomNavigationBar: Row(
        children: [
          //HOME BUTTON
          Material(
              color: const Color.fromARGB(255, 255, 255, 255),

              //ink well is a rectangluar area
              child: InkWell(
                //calling on tap
                onTap: () {
                  //print('called on tap');

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen(
                                key: ObjectKey('welcome page'),
                              )));
                },

                child: const SizedBox(
                  height: kToolbarHeight,
                  width: 150,
                  child: Center(
                    child: ListTile(
                      leading: Icon(Icons.home),
                    ),
                    // child: Text(
                    //   'HOME',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ),
                ),
              )),

          //SEARCH BUTTON
          Expanded(
              child: Material(
                  color: const Color.fromARGB(255, 255, 255, 255),

                  //ink well is a rectangluar area
                  child: InkWell(
                    //calling on tap
                    onTap: () {
                      //print('called on tap');

                      //THIS WILL CHANGE WHEN THE EXPLORE PAGE IS DONE
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen(
                                    key: ObjectKey('welcome page'),
                                  )));
                    },

                    child: const SizedBox(
                      height: kToolbarHeight,
                      width: 150,
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.search),
                        ),
                        // child: Text(
                        //   'SEARCH',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ),
                  ))),

          //SCAN BUTTON

          Expanded(
              child: Material(
                  color: const Color.fromARGB(255, 255, 255, 255),

                  //ink well is a rectangluar area
                  child: InkWell(
                    //calling on tap
                    onTap: () {
                      //print('called on tap');

                      //THIS WILL CHANGE WHEN THE EXPLORE PAGE IS DONE
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScanHomeScreen(
                                    key: ObjectKey('welcome page'),
                                  )));
                    },

                    child: const SizedBox(
                      height: kToolbarHeight,
                      width: 150,
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.camera),
                        ),
                        // child: Text(
                        //   'SCAN',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ),
                  ))),

          //ACCOUNT BUTTON
          Expanded(
              child: Material(
                  color: const Color.fromARGB(255, 255, 255, 255),

                  //ink well is a rectangluar area
                  child: InkWell(
                    //calling on tap
                    onTap: () {
                      //print('called on tap');

                      //THIS WILL CHANGE WHEN THE EXPLORE PAGE IS DONE
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile(
                                  key: ObjectKey('profile page'),
                                  title: 'profile page')));
                    },

                    child: const SizedBox(
                      height: kToolbarHeight,
                      width: 150,
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.account_box_rounded),
                        ),
                        // child: Text(
                        //   'ACCOUNT ',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ),
                    ),
                  )))
        ],
      ),

      body: Center(
        child: Stack(children: [
          Expanded(
              child: Stack(children: [
            Positioned(
                top: 50.0,
                left: 20.0,
                child: Column(children: const <Widget>[
                  Text(
                    "SCAN INGREDIENT",
                    textAlign: TextAlign.left,
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Consola",
                    ),
                  ),
                ])),
            Positioned(
              left: 20,
              right: 20,
              bottom: 320,
              child: Column(
                children: <Widget>[
                  Container(),
                  scanButton,
                  const SizedBox(),
                ],
              ),
            ),
          ])),
          const Divider(
            height: 800,
            thickness: 2,
            indent: 10,
            endIndent: 10,
            color: Color.fromARGB(211, 180, 180, 180),
          ),
          Expanded(
              child: Stack(children: [
            Positioned(
                top: 400.0,
                left: 20.0,
                child: Column(children: const <Widget>[
                  Text(
                    "LOOK UP INGREDIENT",
                    textAlign: TextAlign.left,
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Consola",
                    ),
                  ),
                ])),
            Positioned(
              left: 20,
              right: 20,
              top: 430.0,
              child: Column(
                children: <Widget>[
                  Container(),
                  lookupButton,
                  const SizedBox(),
                ],
              ),
            ),
          ]))
        ]),
      ),
    );
  }
}
