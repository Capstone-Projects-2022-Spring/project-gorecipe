import 'package:flutter/material.dart';
//import 'package:gorecipe/Screens/Dropdown.dart';
import 'package:gorecipe/Screens/event_editing.dart';
import 'package:gorecipe/Screens/preferences.dart';
import 'package:intl/intl.dart';
import 'package:gorecipe/Screens/profile.dart';
import 'package:gorecipe/Screens/scan_home_page.dart';
import 'package:gorecipe/Screens/welcome_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'home_screen.dart';
import 'package:gorecipe/Screens/explore.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  //DateTime? time;
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  //final List<Meeting> meetings = <Meeting>[];

  @override
  State<CalendarPage> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  DateTime? time;
  late final Event event;
  //EventEditingPage page = const EventEditingPage();
  TextStyle style = const TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);
  final startTimeController = TextEditingController();

  int _currentIndex = 0;

  final _children = [
    HomeScreen(),
    Explore(key: ObjectKey('welcome page'), title: 'hi'),
    ScanHomeScreen(),
    Profile(key: ObjectKey('welcome page'), title: 'profile')
  ];

  _onTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            _children[_currentIndex])); // this has changed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //test is widgte that takes a string as an arug- and extracted in the first arg
        //name of the app we are creating
        title: const Text(
          'Calendar',
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
      //  endDrawer: const MyDrawer(ObjectKey('title')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //FloatingActionButtonLocation.centerTop,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.red,
          onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const EventEditingPage()),
              )),
      // ignore: avoid_unnecessary_containers
      body: Container(
        // decoration: BoxDecoration(color: Colors.lightGreen[100]),
        // padding: const EdgeInsets.only(top: 50),
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
          // dataSource: page.getDataSource(),
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
            ListTile(
                leading: const Icon(Icons.set_meal),
                title: const Text('Set Food Preference'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Preferences(
                                key: ObjectKey('welcome page'),
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
                                key: ObjectKey('welcome page'),
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

      //CREATING THE NEW BOTTOM NAV BAR SO BUTTONS WORK

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera, size: 30), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded, size: 30), label: ''),
        ],
        selectedItemColor: Colors.black,
        elevation: 5.0,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _onTap();
        },
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

EventEditingPage page = const EventEditingPage();

List<Meeting> getDataSource() {
  final List<Meeting> meetings = <Meeting>[];

  //final DateTime date = page.;
  return meetings;
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
  DateTime? time;

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
