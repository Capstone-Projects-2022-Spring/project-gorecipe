import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/edit_account.dart';
import 'package:gorecipe/Screens/home_screen.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';

// View profile page

class Profile extends StatefulWidget {
  //const Profile({Key? key}) : super(key: key);
  const Profile({required Key key, required this.title})
      : super(key: key);

  final String title;
  @override
  State<Profile> createState() => _Profile();
}


class _Profile extends State<Profile> {

  @override
  Widget build(BuildContext context){

    const firstName = Text(
      "First",
      textAlign: TextAlign.center,
      textScaleFactor: 2.25,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
    const lastName = Text(
      "Last",
      textAlign: TextAlign.center,
      textScaleFactor: 2.25,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
    const location = Text(
      "Philadelphia, PA",
      textAlign: TextAlign.center,
      textScaleFactor: 1.5,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('ACCOUNT',
            style: TextStyle(
              color: Colors.green,
            ),),
          backgroundColor: Colors.white,
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
                  //   navigation im confused everything is giving me an error
                  // onTap: () => HomeScreen(),

                  //   onTap: () {
                  //   Navigator.pop(context);

                  //},
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

      body: Center(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/images/ingredients.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.2), BlendMode.dstATop),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/default_pfp.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      firstName,
                      lastName,
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 24.0,
                            semanticLabel: 'location symbol',
                          ),
                          location,
                        ],
                      ),


                    ],
                ),

              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.book,
                        color: Colors.green,
                      ),
                      Text('    MyCookbook', textDirection: TextDirection.ltr, textAlign: TextAlign.justify, textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.wysiwyg_rounded,
                        color: Colors.green,
                      ),
                      Text('    Calendar', textDirection: TextDirection.ltr, textAlign: TextAlign.justify, textScaleFactor: 1.5, style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.wifi_protected_setup,
                        color: Colors.green,
                      ),
                      Text('    Update Food Preferences', textDirection: TextDirection.ltr, textAlign: TextAlign.justify, textScaleFactor: 1.5, style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditAccount()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.app_settings_alt,
                        color: Colors.green,
                      ),
                      Text('    Edit Profile', textDirection: TextDirection.ltr, textAlign: TextAlign.justify, textScaleFactor: 1.5, style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      );
  }

}