import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const AgendaItemHeight());

class AgendaItemHeight extends StatelessWidget {
  const AgendaItemHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomAgendaHeight(),
    );
  }
}

class CustomAgendaHeight extends StatefulWidget {
  const CustomAgendaHeight({super.key});

  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<CustomAgendaHeight> {
  final List<String> _size = <String>['60', '50', '40', '30'];
  double _itemHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: const Icon(Icons.settings),
            itemBuilder: (BuildContext context) {
              return _size.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                  ),
                );
              }).toList();
            },
            onSelected: (String value) {
              setState(() {
                if (value == '60') {
                  _itemHeight = 60;
                } else if (value == '50') {
                  _itemHeight = 50;
                } else if (value == '40') {
                  _itemHeight = 40;
                } else if (value == '30') {
                  _itemHeight = 30;
                } else if (value == '20') {
                  _itemHeight = 20;
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SfCalendar(
              view: CalendarView.month,
              dataSource: getCalendarDataSource(),
              monthViewSettings: MonthViewSettings(
                showAgenda: true, agendaItemHeight: _itemHeight,
              ),
            ),
          )],
      ),
    ));
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting',
      color: const Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: -2, hours: 4)),
      endTime: DateTime.now().add(const Duration(days: -2, hours: 5)),
      subject: 'Development Meeting   New York, U.S.A',
      color: const Color(0xFFf527318),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: -2, hours: 3)),
      endTime: DateTime.now().add(const Duration(days: -2, hours: 4)),
      subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
      color: const Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: -2, hours: 2)),
      endTime: DateTime.now().add(const Duration(days: -2, hours: 3)),
      subject: 'Support - Web Meeting   Dubai, UAE',
      color: const Color(0xFFf3282b8),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: -2, hours: 1)),
      endTime: DateTime.now().add(const Duration(days: -2, hours: 2)),
      subject: 'Project Release Meeting   Istanbul, Turkey',
      color: const Color(0xFFf2a7886),
    ));
    appointments.add(Appointment(
        startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
        endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
        subject: 'Release Meeting',
        color: Colors.lightBlueAccent,
        isAllDay: true));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
      endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
      endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
      subject: 'Customer Meeting   Tokyo, Japan',
      color: const Color(0xFFffb8d62),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return _DataSource(appointments);
  }

  IconData getIcon(String subject) {
    if (subject == 'Planning') {
      return Icons.subject;
    } else if (subject == 'Development Meeting   New York, U.S.A') {
      return Icons.people;
    } else if (subject == 'Support - Web Meeting   Dubai, UAE') {
      return Icons.settings;
    } else if (subject == 'Project Plan Meeting   Kuala Lumpur, Malaysia') {
      return Icons.check_circle_outline;
    } else if (subject == 'Retrospective') {
      return Icons.people_outline;
    } else if (subject == 'Project Release Meeting   Istanbul, Turkey') {
      return Icons.people_outline;
    } else if (subject == 'Customer Meeting   Tokyo, Japan') {
      return Icons.settings_phone;
    } else if (subject == 'Release Meeting') {
      return Icons.view_day;
    } else {
      return Icons.beach_access;
    }
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}