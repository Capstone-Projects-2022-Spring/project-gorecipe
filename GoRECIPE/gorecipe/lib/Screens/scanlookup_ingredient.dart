import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/scan_screen.dart';
import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
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
                  MaterialPageRoute(builder: (context) => const WantToAdd()),
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
            // ignore: prefer_const_constructors
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            const ListTile(
              leading: Icon(Icons.set_meal),
              title: Text('Set Food Preference'),
            ),
            const ListTile(
              leading: Icon(Icons.book),
              title: Text('MyCookBook'),
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
              bottom: 310,
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
