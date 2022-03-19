import 'dart:async';
import 'dart:io';
// ignore: unused_import
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

class DisplayPictureScreen extends StatefulWidget {
  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);
  final TextStyle style =
      const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final String imagePath;
  DisplayScreenState createState() => DisplayScreenState();
}

class DisplayScreenState extends State<DisplayPictureScreen> {
  var _foundIngredient = false;
  var _ingredient = "";
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    upload(File img) async {
      var postUri = Uri.parse(
          "http://gorecipe.us-east-2.elasticbeanstalk.com/api/images/upload/3");
      var request = http.MultipartRequest("POST", postUri);
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        await img.readAsBytes(),
        filename: 'image.jpg',
        contentType: MediaType('image', 'jpg'),
      ));
      // ignore: avoid_print
      //print("Request:");
      // ignore: avoid_print
      //print(request);

      var response = await request.send();
      var newResponse = await http.Response.fromStream(response);
      var jason = jsonDecode(newResponse.body);
      // ignore: avoid_print

      _foundIngredient = true;

      print(jason);
      setState(() {
        _ingredient = jason[0]['name'];
      });

      //print(jason[0]['name']);
      /*
      response.stream.transform(utf8.decoder).listen((value) {
        // ignore: avoid_print
        var formated = value.replaceAll('{', '');
        var formated2 = formated.replaceAll('}', '');
        var formated3 = formated2.replaceAll('[', '{');
        var formated4 = formated3.replaceAll(']', '}');
        var dataSp = formated4.split(',');
        Map<String, String> mapData = Map();
        dataSp.forEach((element) =>
            mapData[element.split(':')[0]] = element.split(':')[1]);

        print(newResponse);
      });
      */
    }

    /*
    getData() async {
      print("In download");
      var uri = Uri.http(
          'www.gorecipe.us-east-2.elasticbeanstalk.com', '/api/users/2');

      var request = http.MultipartRequest("GET", uri);

      print("Request:");
      print(request);
      print(request.headers);

      var response = await request.send();
      print(response.statusCode);
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    }
    */

    final _nextbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color.fromARGB(255, 116, 163, 126),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 4,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        onPressed: () {
          upload(File(widget.imagePath));
          //getData();
        },
        child: Text("Next",
            textAlign: TextAlign.center,
            style: widget.style
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        children: [
          Image.file(File(widget.imagePath)),
          const SizedBox(height: 40),
          _nextbutton,
          const SizedBox(height: 40),
          Text(_ingredient,
              textAlign: TextAlign.center,
              style: widget.style
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
