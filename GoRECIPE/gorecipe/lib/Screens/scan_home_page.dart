import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/AddAnIngredient.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/scan_screen.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:gorecipe/Screens/home_screen.dart';

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
      home: ScanHomeScreen(),
    );
  }
}

class ScanHomeScreen extends StatefulWidget {
  const ScanHomeScreen({Key? key}) : super(key: key);
  @override
  State<ScanHomeScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ScanHomeScreen> {
  // ignore: unused_field
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final style = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  //

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

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override

  //widget is a class name that acts as a type
  //class returning a widget
  //type of parament of what this will hold
  Widget build(BuildContext context) {
    //start scan button

    final startscanbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color.fromARGB(255, 255, 255, 255),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            //CHANGE THIS TO THE NEXT SCAN PAGE
            MaterialPageRoute(builder: (context) => const AddAnIngredient()),
          );
        },
        child: Text("Start Scan",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20)),
      ),
    );

    //widet draw all to the screen
    //Scaffold create a page with a white background

    return Scaffold(
        //tool bar at the top of the screen
        backgroundColor: Color.fromARGB(255, 116, 163, 126),
        appBar: AppBar(
          //test is widgte that takes a string as an arug- and extracted in the first arg
          //name of the app we are creating
          title: const Text(
            'SCAN',
            style: TextStyle(color: Color.fromARGB(255, 116, 163, 126)),

            // style: GoogleFonts.Lato(
            //textStyle: style,
            // ),
            //style:GoogleFonts.lato(Color.fromARGB(255, 255, 255, 255), letterSpacing: 6);
            //style: GoogleFonts.lato(textStyle: PageTitle),
            //style: GoogleFonts.lato(textStyle: PageTitle),
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
                    //navigation im confused everything is giving me an error
                    //onTap: () => HomeScreen(),

                    // onTap: () {
                    //   Navigator.pop(context);

                    // },
                  }),
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
        body: Center(
          child: Stack(children: [
            Positioned(
                child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: const Image(
                    image: AssetImage("assets/images/scan.png"),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )),
            Positioned(
                top: 450.0,
                left: 20.0,
                child: Column(children: const <Widget>[
                  Text(
                    "READY TO FIND RECIPE?",
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
                top: 500.0,
                left: 50.0,
                right: 50.0,
                child: Column(children: const <Widget>[
                  Text(
                    "Scan the food item you want to incoorporate.",
                    textAlign: TextAlign.left,
                    textScaleFactor: 2.0,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 9.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Consola",
                    ),
                  ),
                ])),
            Positioned(
                bottom: 70.0,
                left: 90,
                right: 90,
                child: Column(
                  children: <Widget>[
                    //Declaring sizes of field boxes
                    startscanbutton,
                    const SizedBox(
                      height: 3.0,
                    ),
                  ],
                )),
          ]),
        ));
  }
}
