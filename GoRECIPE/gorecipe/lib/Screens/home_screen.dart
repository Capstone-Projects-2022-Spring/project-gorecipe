import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
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
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final style = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  //

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

  //widget is a class name that acts as a type
  //class returning a widget
  //type of parament of what this will hold
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
          style: TextStyle(color: Colors.green),

          // style: GoogleFonts.Lato(
          //textStyle: style,
          // ),
          //style:GoogleFonts.lato(Color.fromARGB(255, 255, 255, 255), letterSpacing: 6);
          //style: GoogleFonts.lato(textStyle: PageTitle),
          //style: GoogleFonts.lato(textStyle: PageTitle),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.green,
            //   ),
            //   child: Text(
            //     'GoRecipe',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 24,
            //     ),
            //   ),
            // ),
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

            const ListTile(
              leading: Icon(Icons.help_center),
              title: Text('Help'),
            ),

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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'EXPLORE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'SCAN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ACCOUNT',
          ),
        ],

        ///curent index is the selcted index number
        currentIndex: _selectedIndex,
        //changes the color of the selected nav bar
        selectedItemColor: const Color.fromARGB(255, 15, 136, 19),
        //nav bar unslected item
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),

        //color is changed on tap
        onTap: _onItemTapped,
      ),
    );
  }
}
