import 'package:flutter/material.dart';

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
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 50,
              color: Colors.black,
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
          ],
        ),

      body: Center(
        child: Column(
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
                child: FlatButton(
                  onPressed: () {},
                  color: Colors.white,
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.book,
                        color: Colors.green,
                      ),
                      Text('    MyCookbook', textDirection: TextDirection.ltr, textAlign: TextAlign.justify, textScaleFactor: 1.5,),
                    ],
                  ),
                ),
              ),
              /*child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                    Icons.book,
                    color: Colors.green
                ),
                label: Text('MyCookbook', textAlign: TextAlign.left, textScaleFactor: 1.5,),
                color: Colors.white,
                minWidth: double.infinity,
              ),*/
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  onPressed: () {},
                  color: Colors.white,
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.wysiwyg_rounded,
                        color: Colors.green,
                      ),
                      Text('    Calendar', textDirection: TextDirection.ltr, textAlign: TextAlign.justify, textScaleFactor: 1.5,),
                    ],
                  ),
                ),
              ),
              /*child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                    Icons.wysiwyg_rounded,
                    color: Colors.green
                ),
                label: Text('Calendar', textScaleFactor: 1.5,),
                color: Colors.white,
                minWidth: double.infinity,
              ),*/
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  onPressed: () {},
                  color: Colors.white,
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.wifi_protected_setup,
                        color: Colors.green,
                      ),
                      Text('    Update Food Preferences', textDirection: TextDirection.ltr, textAlign: TextAlign.justify, textScaleFactor: 1.5,),
                    ],
                  ),
                ),
              ),
              /*child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                    Icons.wifi_protected_setup,
                    color: Colors.green
                ),
                label: Text('Update Food Preferences', textScaleFactor: 1.5,),
                color: Colors.white,
                minWidth: double.infinity,
              ),*/
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  onPressed: () {},
                  color: Colors.white,
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.app_settings_alt,
                        color: Colors.green,
                      ),
                      Text('    Edit Profile', textDirection: TextDirection.ltr, textAlign: TextAlign.justify, textScaleFactor: 1.5,),
                    ],
                  ),
                ),
              ),
              /*child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                    Icons.app_settings_alt,
                    color: Colors.green
                ),
                label: Text('Edit Profile', textScaleFactor: 1.5,),
                color: Colors.white,
                minWidth: double.infinity,
              ),*/
            ),
            ],
          ),
        ),
      );
  }

}