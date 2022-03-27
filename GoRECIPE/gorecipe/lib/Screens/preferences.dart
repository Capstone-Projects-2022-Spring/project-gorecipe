import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/Components/checkbox_state.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:gorecipe/Screens/home_screen.dart';
// ignore: unused_import
//import 'package:gorecipe/Screens/forgot_password.dart';
//import 'package:gorecipe/Screens/forgot_password.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
// ignore: unused_import
import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
//import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
// ignore: unused_import
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

  static const String _title = 'Set Food Preferences';

  @override
  Widget build(BuildContext context) {
    //MaterialAPp() is the core widget- widget that wraps the entire app
    //themes, nav, etc..
    return const MaterialApp(
      title: _title,
      home: Preferences(),
    );
  }
}

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);
  @override
  State<Preferences> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Preferences> {
  final diet = [
    CheckBoxState(title: 'Vegan'),
    CheckBoxState(title: 'Gluten free'),
    CheckBoxState(title: 'Ketogenic'),
    CheckBoxState(title: 'Vegetarian'),
    CheckBoxState(title: 'Lacto-Vegetarian'),
    CheckBoxState(title: 'Ovo-Vegetarian'),
    CheckBoxState(title: 'Pescetarian'),
    CheckBoxState(title: 'Paleo'),
    CheckBoxState(title: 'Primal'),
    CheckBoxState(title: 'Low FODMAP'),
    CheckBoxState(title: 'Whole30'),
  ];

  final intolerance = [
    CheckBoxState(title: 'Dairy'),
    CheckBoxState(title: 'Egg'),
    CheckBoxState(title: 'Gluten'),
    CheckBoxState(title: 'Grain'),
    CheckBoxState(title: 'Peanut'),
    CheckBoxState(title: 'Seasfood'),
    CheckBoxState(title: 'Seasame'),
    CheckBoxState(title: 'Shellfish'),
    CheckBoxState(title: 'Soy'),
    CheckBoxState(title: 'Sulfute'),
    CheckBoxState(title: 'Tree Nut'),
    CheckBoxState(title: 'Wheat'),
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
          'Set Food Preferences',
          style: TextStyle(color: Colors.green),

          //style: GoogleFonts.Lato(
          //textStyle: style,
          //),
          //),
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
              leading: Icon(Icons.set_meal),
              title: Text('Set Food Preference'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Preferences()));
              },
            ),
            ListTile(
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
            const ListTile(
              leading: Icon(Icons.help_center),
              title: Text('Help'),
            ),
            // putting the scan oon the dropdown menu for now

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

      //CREATING THE NEW BOTTOM NAV BAR SO BUTTONS WORK
      bottomNavigationBar: Row(
        children: [
          //HOME BUTTON
          Material(
              color: Color.fromARGB(255, 255, 255, 255),

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
                  color: Color.fromARGB(255, 255, 255, 255),

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
                  color: Color.fromARGB(255, 255, 255, 255),

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
                  color: Color.fromARGB(255, 255, 255, 255),

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

      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          const Text('SET DIET', style: TextStyle(fontSize: 25)),
          //converting the checkbox state to a widget
          ...diet.map(buildSingleCheckbox).toList(),
          const Text('SET INTROLERANCE', style: TextStyle(fontSize: 25)),
          //converting the checkbox state to a widget
          ...intolerance.map(buildSingleCheckbox).toList(),

          // CheckboxListTile(
          //   //moves checkbox to the left of word
          //   controlAffinity: ListTileControlAffinity.leading,
          //   activeColor: Colors.green,
          //   value: value,
          //   title: const Text(
          //     'Preferences',
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   //so the value change and the Ui gets updated
          //   onChanged: (value) => setState(() => this.value = value!),
          // ),
        ],
      ),
    );
  }

  Widget buildSingleCheckbox(CheckBoxState checkbox) => CheckboxListTile(
        //moves checkbox to the left of word
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.green,
        value: checkbox.value,
        title: Text(
          checkbox.title,
          style: TextStyle(fontSize: 20),
        ),
        //so the value change and the Ui gets updated
        onChanged: (value) => setState(() => checkbox.value = value!),
      );
}
