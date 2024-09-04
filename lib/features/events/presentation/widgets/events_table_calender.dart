import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsTableCalender extends StatefulWidget {
  const EventsTableCalender({super.key});

  @override
  State<EventsTableCalender> createState() => _EventsTableCalenderState();
}

class _EventsTableCalenderState extends State<EventsTableCalender> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TableCalendar(
        focusedDay: today,
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        rowHeight: 40,
        headerStyle:
            const HeaderStyle(titleCentered: true, formatButtonVisible: false),
        availableGestures: AvailableGestures.all,
        selectedDayPredicate: (day) => isSameDay(day, today),
        onDaySelected: _onDaySelected,
        daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(fontSize: 10),
            weekdayStyle: TextStyle(fontSize: 10)),
      ),
    );
  }
}
