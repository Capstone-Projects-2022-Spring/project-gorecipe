import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/create_account.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/welcome_screen_state.dart';
import 'package:gorecipe/Screens/profile.dart';

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
      color: Color.fromARGB(255, 82, 146, 26),
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
                color: Colors.black, fontWeight: FontWeight.w500)),
      ),
    );
    final ScanLookup = Material(
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
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
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
                  ScanLookup,
                  const SizedBox(),
                ],
              ),
            ),
            Positioned(
                bottom: 50.0,
                right: 90.0,
                left: 90.0,
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

