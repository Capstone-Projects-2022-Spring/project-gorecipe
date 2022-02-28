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

    const headerText = Text(
      "Account",
      textAlign: TextAlign.center,
      textScaleFactor: 2.0,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    return Scaffold(
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
              padding: const EdgeInsets.all(36.0),
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
                            image: AssetImage("assets/images/logo.png"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    headerText,
                  ]
              )
            )
          ),
        )
      )

    );
  }

}