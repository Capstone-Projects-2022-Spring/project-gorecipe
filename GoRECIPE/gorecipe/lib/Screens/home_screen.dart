import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
// ignore: unused_import

// import 'package:gorecipe/Screens/forgot_password.dart';
//import 'package:gorecipe/Screens/forgot_password.dart';
//import 'package:gorecipe/Screens/forgot_password.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
//import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/welcome_screen.dart';

// ignore: unused_import
import 'package:gorecipe/Screens/bottom_nav_bar.dart';
import 'package:gorecipe/Screens/recipes_for_you.dart';
import 'package:gorecipe/Screens/preferences.dart';
import 'package:gorecipe/Screens/explore.dart';

//import 'package:gorecipe/Screens/welcome_screen.dart';

//moethod doesnt return nothing
void main() {
  //run function
  //argument has to be a widget
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'GoRecipe';

  @override
  Widget build(BuildContext context) {
    //MaterialAPp() is the core widget- widget that wraps the entire app
    //themes, nav, etc..
    return const MaterialApp(
      title: _title,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomeScreen> {
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

  // ignore: unused_field
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final style = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  // ignore: unused_field
  static const List<Widget> _widgetOptions = <Widget>[
    WantToAdd(
      title: '',
    ),
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

  @override

  //widget is a class name that acts as a type
  //class returning a widget
  //type of parament of what this will hold
  // ignore: dead_code,
  Widget build(BuildContext context) {
    //name: argument
    //widet draw all to the screen
    //Scaffold create a page with a white background

    return Scaffold(
      //tool bar at the top of the screen

      appBar: AppBar(
        //test is widgte that takes a string as an arug- and extracted in the first arg
        //name of the app we are creating
        title: const Text(
          'GoRecipe',
          style: TextStyle(color: Color.fromARGB(255, 116, 163, 126)),

          //style: GoogleFonts.Lato(
          //textStyle: style,
          //),
          //),
          //style:GoogleFonts.lato(Color.fromARGB(255, 255, 255, 255), letterSpacing: 6);
          //style: GoogleFonts.lato(textStyle: PageTitle),
          //style: GoogleFonts.lato(textStyle: PageTitle),
        ),

        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 116, 163, 126)),
      ),
      body: RecipesYou(ingredientList: ["apple"], choice: 2),

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
                        builder: (context) => const BottomNav(
                              key: ObjectKey('profile page'),
                            )));
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
