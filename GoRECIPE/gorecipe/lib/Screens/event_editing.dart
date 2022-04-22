// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gorecipe/Models/User.dart';
import 'package:intl/intl.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;
import '../../globals.dart' as globals;
import '../Models/Recipe.dart';

class EventEditingPage extends StatefulWidget {
  //const EventEditingPage(this.event) : super(key: key);

  final Meeting? event;
  const EventEditingPage({Key? key, this.event}) : super(key: key);

  @override
  _EventEditingPageState createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  String? recipe = 'Spaghetti';
  late DateTime? fromDate;
  late DateTime toDate;
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late final void Function()? onChanged;
  late User currentUser;
  List recipes = <Recipe>[];

  Future getSavedRecipes() async {
    var response = await http.get(
      Uri.parse('http://gorecipe.us-east-2.elasticbeanstalk.com/api/users/' +
          currentUser.id.toString() +
          '/recipes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      List temp = (json.decode(response.body) as List)
          .map((i) => Recipe.fromJson(i))
          .toList();
      setState(() {
        recipes = temp;
      });
    } else {
      print("cannot get data");
    }
  }

  @override
  void initState() {
    currentUser = globals.user;
    getSavedRecipes();
    super.initState();
  }

//hardcoded recipe list right now
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Spaghetti"), value: "Spaghetti"),
      const DropdownMenuItem(child: Text("Pizza"), value: "Pizza"),
      const DropdownMenuItem(child: Text("Chicken"), value: "Chicken"),
      const DropdownMenuItem(child: Text("Steak"), value: "Steak"),
    ];
    return menuItems;
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  TextStyle style = const TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 163, 126),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 116, 163, 126),
        foregroundColor: Colors.white,
        shadowColor: Color.fromARGB(255, 32, 95, 8),
        leading: const CloseButton(),
        actions: buildEditingActions(),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //buildTitle(),
                  headerText,
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: Text("Choose date"),
                  ),
                  Text(
                      "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}"),
                  buildTitle(),
                  //, onClicked: onClicked)
                ],
              ))));

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            icon: const Icon(Icons.done),
            label: const Text('SAVE'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalendarPage()));
            } //saveForm,
            ),
      ];

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  Widget buildTitle() => Positioned(
      bottom: 90.0,
      child: Column(children: <Widget>[
        TextFormField(
          style: style,
          minLines: 1,
          maxLines: 5,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,

              /// border: UnderlineInputBorder(),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Add Notes",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0))),
        )

        //onFieldSubmitted: (_) => saveForm(),
        //validator: (title) =>
        //  title != null && title.isEmpty ? 'Title cannot be empty' : null,
        //  controller: titleController,
        // ),
      ]));

  static const headerText = Text(
    "Add Recipe",
    textAlign: TextAlign.center,
    textScaleFactor: 2.0,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  String? returnRecipe() {
    return recipe;
  }

// ignore: unused_element
  List<Meeting> getTheDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    //final DateTime today = DateTime.now();
    //final DateTime startTime =
    // DateTime(today.year, today.month, today.day, 9, 0, 0);
    //final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(recipes, selectedDate,
        const Color.fromARGB(255, 116, 163, 126), false));
    return meetings;
  }

  DateTime returnDate() {
    DateTime date = selectedDate;
    return date;
  }

  final List<Meeting> meetingss = [];

//still trying to figure this out
  Future saveForm() async {
    //final List<Meeting> meetings = <Meeting>[];
    // Text((recipes.length > 0 ? recipes[0]['recipe'] : ''));
    //var recipes2 = recipes;

    // ignore: unnecessary_null_comparison
    //if (recipes != null && recipes.length != 0) {
    //meetings.add(Meeting(recipes2[0].name, selectedDate,
    //  const Color.fromARGB(255, 116, 163, 126), false));
    // }
    final isValid = _formKey.currentState!.validate();

    //final isValid = formKey.currentState!.validate();

    if (isValid) {
      //meeting.addToCal();
      // ignore: unused_local_variable
      //  final me = Meeting(
      //      title: titleController.text,
      //     description: 'Description',
      // from: fromDate,
      //t/o: toDate,
      //isAllDay: false,
      //);
      Navigator.of(context).pop();
    }
    //return meetings;
  }
}

class MeetingDataSources extends CalendarDataSource {
  DateTime? time;

  MeetingDataSources(List<dynamic> source) {
    //this.source = source;
    appointments = source;
  }

  //@override
  static String toDate(DateTime datetime) {
    final date = DateFormat.yMMMEd().format(datetime);
    return date;
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);
    return time;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.background, this.isAllDay);

  List<dynamic> eventName;
  DateTime? from;
  //DateTime to;
  Color background;
  bool isAllDay;
}
