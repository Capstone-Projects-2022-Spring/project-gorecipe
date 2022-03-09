import 'package:flutter/material.dart';
import 'package:gorecipe/Screens/scan_screen.dart';

class ScanOptionScreen extends StatefulWidget {
  const ScanOptionScreen({Key? key}) : super(key: key);

  @override
  Scan_Option_State createState() => Scan_Option_State();
}

// ignore: camel_case_types
class Scan_Option_State extends State<ScanOptionScreen> {
  TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    InkWell _takehomebutton = InkWell(
      child: Column(
        children: [
          const Text(
            "Take a Picture",
            textAlign: TextAlign.center,
            textScaleFactor: 2.0,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            width: 250,
            child: Stack(
              fit: StackFit.expand,
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
                ),
                const Positioned(
                    child: Icon(
                  Icons.photo_camera,
                  size: 40,
                ))
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TakePictureScreen()),
        );
      },
    );

    InkWell _gallerybutton = InkWell(
      child: Column(
        children: [
          const Text(
            "Choose From Gallery",
            textAlign: TextAlign.center,
            textScaleFactor: 2.0,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            width: 250,
            child: Stack(
              fit: StackFit.expand,
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
                ),
                const Positioned(
                  child: Icon(
                    Icons.photo_library,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        print("Tapped on container2");
      },
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _takehomebutton,
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              _gallerybutton,
            ],
          ),
        ),
      ),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
