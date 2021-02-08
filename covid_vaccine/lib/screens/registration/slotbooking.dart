import 'package:covid_vaccine/screens/home/home.dart';
import 'package:covid_vaccine/screens/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Slotbooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlotbookingPage(
      title: "Slot booking Page",
    );
  }
}

class SlotbookingPage extends StatefulWidget {
  final String title;
  SlotbookingPage({Key key, this.title}) : super(key: key);

  @override
  _SlotbookingPageState createState() => _SlotbookingPageState();
}

class _SlotbookingPageState extends State<SlotbookingPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  List<Meeting> meetings;

  @override
  Widget build(BuildContext context) {
    final cancelButton = Container(
        child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red[900],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //Navigator.of(context).pop();
          Navigator.popUntil(context, ModalRoute.withName('/home'));
        },
        child: Text("Cancel",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ));

    final confirmButton = Container(
        child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green[700],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        //onPressed: () {}, // here we need to add the functionality
        onPressed: () {
          /*
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );*/
          Navigator.popUntil(context, ModalRoute.withName('/home'));
        },
        child: Text("Confirm",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ));
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("OTP Page"),
      ),*/
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 5.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.blue,
              size: 30.0,
            ),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          title: Text('Slot Booking',
              style: style.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              )),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.blue,
                size: 30.0,
              ),
              tooltip: 'Refresh',
              onPressed: null,
            ),
          ],
        ),
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  //width: 800,
                  children: <Widget>[
                    SfCalendar(
                      view: CalendarView.month,
                      dataSource: MeetingDataSource(_getDataSource()),
                      // by default the month appointment display mode set as Indicator, we can
                      // change the display mode as appointment using the appointment display
                      // mode property
                      monthViewSettings: MonthViewSettings(
                          appointmentDisplayMode:
                              MonthAppointmentDisplayMode.appointment),
                    ),
                    Row(
                      children: [
                        new Flexible(
                          child: Container(
                              child: cancelButton,
                              alignment: Alignment.centerLeft),
                          flex: 2,
                        ),
                        new Flexible(
                          child: Container(
                            alignment: Alignment.center,
                          ),
                          flex: 1,
                        ),
                        new Flexible(
                          child: Container(
                              child: confirmButton,
                              alignment: Alignment.centerRight),
                          flex: 2,
                        )
                      ],
                    ),
                  ]),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Calendar Demo', home: MyHomePage());
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

// Custom business object class which contains properties to hold the detailed
// information about the event data which will be rendered in calendar.
class Meeting {
  // Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  // Event name which is equivalent to subject property of [Appointment].
  String eventName;

  // From which is equivalent to start time property of [Appointment].
  DateTime from;

  // To which is equivalent to end time property of [Appointment].
  DateTime to;

  // Background which is equivalent to color property of [Appointment].
  Color background;

  // IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
