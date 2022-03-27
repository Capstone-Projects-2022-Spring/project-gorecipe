import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gorecipe/Screens/calendar_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventEditingPage extends StatefulWidget {
  //const EventEditingPage(this.event) : super(key: key);

  final Event? event;
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

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    } else {
      final event = widget.event!;

      titleController.text = event.title;
      fromDate = event.from;
      toDate = event.to;
    }
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

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shadowColor: Colors.pink,
        leading: const CloseButton(),
        actions: buildEditingActions(),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
              key: _formKey,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //buildTitle(),
                  headerText,
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 12),
                  // buildDateTimePickers(),
                  DropdownButton(
                      value: recipe,
                      items: dropdownItems,
                      onChanged: (String? newValue) {
                        setState(() {
                          recipe = newValue;
                        });
                      }),
                  DropdownButton<DateTime>(

                      // hint: const Text('Choose A Date'),
                      items: ['Choose A Date']
                          .map(
                              (e) => DropdownMenuItem<DateTime>(child: Text(e)))
                          .toList(),
                      onChanged: (DateTime? value) {
                        setState(() {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2099))
                              .then(
                            (date) {
                              setState(() {
                                fromDate = date;
                                //meetings.add
                              });
                            },
                          );
                        });
                      }),
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
          onPressed: saveForm,
        ),
      ];

  Widget buildTitle() => TextFormField(
        style: style,
        minLines: 1,
        maxLines: 5,
        decoration: const InputDecoration(
          //border: UnderlineInputBorder(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.vertical(),
          ),
          hintText: 'Add Notes',
        ),
        onFieldSubmitted: (_) => saveForm(),
        //validator: (title) =>
        //  title != null && title.isEmpty ? 'Title cannot be empty' : null,
        controller: titleController,
      );

  static const headerText = Text(
    "Add Recipe & Date",
    textAlign: TextAlign.center,
    textScaleFactor: 2.0,
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );

  String? returnRecipe() {
    return recipe;
  }

  Widget buildDateTimePickers() => Column(
        children: [
          buildFrom(),
          buildTo(),
        ],
      );

  Widget buildFrom() => buildHeader(
        header: 'FROM',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropDownMenuField(
                text: MeetingDataSource.toDate(toDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
                child: buildDropDownMenuField(
                    text: MeetingDataSource.toTime(toDate),
                    onClicked: () => pickFromDateTime(pickDate: false)))
          ],
        ),
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate: DateTime(2101),
      );

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  Widget buildTo() => buildHeader(
        header: 'TO',
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropDownMenuField(
                text: MeetingDataSource.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
              ),
            ),
            Expanded(
                child: buildDropDownMenuField(
              text: MeetingDataSource.toTime(toDate),
              onClicked: () => pickToDateTime(pickDate: false),
            ))
          ],
        ),
      );

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;

    // if (date.isAfter(toDate)) {
    // toDate =
    //   DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    // }

    setState(() => toDate = date);
  }

  Widget buildDropDownMenuField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
          title: Text(text),
          trailing: const Icon(Icons.arrow_drop_down),
          onTap: onClicked);

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(header, style: style)],
      );

// ignore: unused_element
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        Meeting(recipe, fromDate, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  final List<Meeting> meetingss = [];

//still trying to figure this out
  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      // meeting.addToCal();
      // ignore: unused_local_variable
      final event = Event(
        title: titleController.text,
        // description: 'Description',
        from: fromDate,
        to: toDate,
        //isAllDay: false,
      );
      Navigator.of(context).pop();
    }
  }
}

class Event {
  // Event(this.eventName, this.from, this.to, this.background, this.isAllDay);

  //String eventName;
  // DateTime from;
  // DateTime to;
  //Color background;
  //bool isAllDay;
  final String title;
  //final String description;
  final DateTime? from;
  final DateTime to;
  final Color backgroundColor;
  //final bool isAllDay;

  Event({
    required this.title,
    //required this.description,
    required this.from,
    required this.to,
    this.backgroundColor = Colors.lightGreen,
    //this.isAllDay = false,
  });
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> source) {
    //this.source = source;
    appointments = source;
  }

  static String toDate(DateTime datetime) {
    final date = DateFormat.yMMMEd().format(datetime);
    return date;
  }
}
