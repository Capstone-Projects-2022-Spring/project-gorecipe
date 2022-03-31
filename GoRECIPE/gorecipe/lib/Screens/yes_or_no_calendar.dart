import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/create_account.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/explore.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';

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
      home: yes_or_no_calendar(),
    );
  }
}

class yes_or_no_calendar extends StatefulWidget {
  const yes_or_no_calendar({Key? key}) : super(key: key);
  @override
  State<yes_or_no_calendar> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<yes_or_no_calendar> {
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
    final NO = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromARGB(255, 162, 218, 160),
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
      color: Color.fromARGB(255, 162, 218, 160),
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
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        iconTheme: IconThemeData(color: Colors.green),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
          Positioned(
              top: 50.0,
              left: 10.0,
              child: Column(children: const <Widget>[
                Text(
                  "ADD AN RECIPE",
                  textAlign: TextAlign.left,
                  textScaleFactor: 2.0,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
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
                    color: Color.fromARGB(255, 152, 206, 150),
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Consola",
                  ),
                ),
              ])),
          Positioned(
            left: 20,
            right: 20,
            bottom: 250,
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: const Image(
                    image: AssetImage("assets/images/yes_no_page.PNG"),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color.fromARGB(255, 162, 218, 160),
                    ),
                    width: 400,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Recipe Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 150.0,
              right: 90.0,
              left: 90.0,
              child: Column(
                children: <Widget>[
                  //Declaring sizes of field boxes
                  YES,
                  const SizedBox(
                    height: 3.0,
                  ),
                ],
              )),
          Positioned(
              bottom: 50.0,
              right: 90.0,
              left: 90.0,
              child: Column(
                children: <Widget>[
                  //Declaring sizes
                  NO,
                  const SizedBox(
                    height: 3.0,
                  ),
                ],
              ))
        ]),
      ),
      //CREATING THE NEW BOTTOM NAV BAR SO BUTTONS WORK

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, size: 30), label: 'Scan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded, size: 30),
              label: 'Profile'),
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
