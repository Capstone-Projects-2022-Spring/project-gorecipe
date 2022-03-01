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

    const userName = Text(
      "User Name",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
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
    //const IconData location_on = IconData(0xe3ab, fontFamily: 'MaterialIcons');

    return Scaffold(
        appBar: AppBar(
          title: const Text('ACCOUNT'),
          actions: <Widget>[

            IconButton(
              icon: const Icon(Icons.menu),
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
        child: SingleChildScrollView(
          child: Container(
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
                    userName,
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
                    const SizedBox(
                      height: 80.0,
                    ),
                    SizedBox(
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(
                            Icons.book
                        ),
                        label: Text('MyCookbook'),
                        color: Colors.white,
                        minWidth: double.infinity,
                      ),
                    ),
                    SizedBox(
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(
                            Icons.wysiwyg_rounded
                        ),
                        label: Text('Calendar'),
                        color: Colors.white,
                        minWidth: double.infinity,
                      ),
                    ),
                    SizedBox(
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(
                            Icons.wifi_protected_setup
                        ),
                        label: Text('Update Food Preferences'),
                        color: Colors.white,
                        minWidth: double.infinity,
                      ),
                    ),
                    SizedBox(
                      child: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(
                            Icons.app_settings_alt
                        ),
                        label: Text('Edit Profile'),
                        color: Colors.white,
                        minWidth: double.infinity,
                      ),
                    )
                  ],
              ),

            ),

          ),
        )
      )

    );
  }

}