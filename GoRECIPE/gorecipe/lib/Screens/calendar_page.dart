import 'package:flutter/material.dart';
//import 'package:gorecipe/Screens/Dropdown.dart';
import 'package:gorecipe/Screens/event_editing.dart';
import 'package:intl/intl.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'home_screen.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  //final List<Meeting> meetings = <Meeting>[];

  @override
  State<CalendarPage> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  late final Event event;
  TextStyle style = const TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);
  final startTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  endDrawer: const MyDrawer(ObjectKey('title')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.red,
          onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const EventEditingPage()),
              )),
      // ignore: avoid_unnecessary_containers
      body: Container(
        decoration: BoxDecoration(color: Colors.lightGreen[100]),
        padding: const EdgeInsets.only(top: 50),
        child: SfCalendar(
          view: CalendarView.month,
          allowedViews: const [
            CalendarView.day,
            CalendarView.week,
            CalendarView.month,
            CalendarView.schedule
          ],
          showNavigationArrow: true,
          todayHighlightColor: Colors.red,
          dataSource: MeetingDataSource(_getDataSource()),
          //trying to figure out how to save events using this
          // dataSource: EventDataSource(_getDataSource()),
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ),
      ),

      endDrawer: //const MyDrawer(ObjectKey('title')),
          Drawer(
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
    );
  }

  final EventEditingPage page = const EventEditingPage();

  //right now this is just hard coding putting something on the calendar
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        // Meeting('Recipe', startTime, endTime, const Color(0xFF0F8644), false));
        Meeting('recipe', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

//trying to figure out how to use this and the method to save events
String recipe = '';
DateTime from = 0 as DateTime;
DateTime to = 0 as DateTime;
Color back = const Color(0xFF0F8644);
bool flag = false;

void addToCal(
    String recipe, DateTime from, DateTime to, Color back, bool flag) {
  final List<Meeting> meeting = <Meeting>[];

  meeting.add(Meeting(recipe, from, to, back, flag));
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
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
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String? eventName;
  DateTime? from;
  DateTime to;
  Color background;
  bool isAllDay;
}
