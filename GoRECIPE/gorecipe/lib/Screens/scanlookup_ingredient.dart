import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/preferences.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/scan_screen.dart';
import 'package:gorecipe/Screens/want_to_add_ingredient.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';

class ScanLookup extends StatefulWidget {
  const ScanLookup({Key? key}) : super(key: key);

  @override
  State<ScanLookup> createState() => _ScanLookup();
}

class _ScanLookup extends State<ScanLookup> {
  TextStyle style = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

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

    final scanButton = IconButton(
      icon: Image.asset("assets/images/scanbutton.PNG"),
      iconSize: 200,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScanScreen()),
        );
      },
    );

    const lookupText = Text(
      "Look Up Ingredient",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    final lookupButton = IconButton(
      icon: Image.asset("assets/images/lookupbutton.PNG"),
      iconSize: 200,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const WantToAdd(
                  key: ObjectKey(ScanLookup()), title: "Add Ingredient")),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        //test is widgte that takes a string as an arug- and extracted in the first arg
        //name of the app we are creating
        title: const Text(
          'Add Ingredient',
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Declaring sizes of field boxes
                const SizedBox(height: 55.0),
                scanText,
                const SizedBox(height: 65.0),
                scanButton,
                const Divider(
                  color: Colors.black,
                  height: 150.0,
                  indent: 0,
                  endIndent: 0,
                ),
                const SizedBox(height: 55.0),
                lookupText,
                const SizedBox(height: 65.0),
                lookupButton,
                const SizedBox(
                  height: 35.0,
                ),
              ],
            ),
          ),
        ),
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
    );
  }
}
