# How to customize the agenda item height in the Flutter event calendar (SfCalendar)?


In the flutter event calendar, you can customize the agenda item height using the `agendaItemHeight` property of the `MonthViewSettings` in the calendar widget.

## Step 1:
In initState(), set the default values for calendar view, item height.

```xml
CalendarView _calendarView;
List<Appointment> appointmentDetails;
double itemHeight;
@override
void initState() {
  appointmentDetails = <Appointment>[];
  _calendarView = CalendarView.month;
  itemHeight = 0.0;
  super.initState();
}
```
 

## Step 2:
Select the item height value from the `PopupMenuItem` and customize the agenda item height using this height value.

```xml
appBar: AppBar(
  actions: <Widget>[
    PopupMenuButton<String>(
      icon: Icon(Icons.settings),
      itemBuilder: (BuildContext context) {
        return size.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              '$choice',
            ),
          );
        }).toList();
      },
      onSelected: (String value) {
        setState(() {
          if (value == '60') {
            itemHeight = 60;
          } else if (value == '50') {
            itemHeight = 50;
          } else if (value == '40') {
            itemHeight = 40;
          } else if (value == '30') {
            itemHeight = 30;
          } else if (value == '20') {
            itemHeight = 20;
          }
        });
      },
    ),
  ],
),
```

## Step 3:
Assign the item height value to the `agendaItemHeight` property of the `MonthViewSettings` in the calendar widget.

```xml
body: Column(
  children: <Widget>[
    Expanded(
      child: SfCalendar(
        view: _calendarView,
        dataSource: getCalendarDataSource(),
        monthViewSettings:
            MonthViewSettings(showAgenda: true, agendaItemHeight: itemHeight),
      ),
    ),
  ],
),
```
**[View document in Syncfusion Flutter Knowledge base](https://www.syncfusion.com/kb/11015/how-to-customize-the-agenda-item-height-in-the-flutter-event-calendar-sfcalendar)**

**Screenshots**

![height1](http://www.syncfusion.com/uploads/user/kb/flut/flut-709/flut-709_img1.jpeg)
![height2](http://www.syncfusion.com/uploads/user/kb/flut/flut-709/flut-709_img2.jpeg)
![height3](http://www.syncfusion.com/uploads/user/kb/flut/flut-709/flut-709_img3.jpeg)
