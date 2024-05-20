import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Constants/colors.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  DateTime? _selectedDay;
  List<String> selectedDates = [];
  List<DateTime> dateTimeList = [];
  DateTime? _rangeState;
  DateTime? _rangeEnd;
  var selectedItem;
  bool startSelecting = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusedDay = DateTime.now();
    _calendarFormat = CalendarFormat.month;
    _selectedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(Duration(days: 365));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      width: width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: TableCalendar(
          pageJumpingEnabled: true,
          availableGestures: AvailableGestures.all,
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          daysOfWeekVisible: true,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          firstDay: _firstDay,
          lastDay: _lastDay,
          focusedDay: _focusedDay,
          pageAnimationCurve: Curves.slowMiddle,
          formatAnimationCurve: Curves.easeOutCirc,
          pageAnimationDuration: const Duration(milliseconds: 100),
          dayHitTestBehavior: HitTestBehavior.deferToChild,
          daysOfWeekHeight: 30,
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
          },
          daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: GoogleFonts.poppins(),
              weekendStyle: GoogleFonts.workSans(),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(7))),
          onDaySelected: (date, events) async {
            setState(() {
              _selectedDay = date;
              _focusedDay = events;
              selectedItem = "${date.day}/${date.month}/${date.year}";
              // if (selectedDates
              //     .contains("${date.day}/${date.month}/${date.year}")) {

              if (selectedDates.contains("${date.toString()}")) {
                selectedDates.remove("${date.toString()}");
              } else {
                startSelecting = false;
                selectedDates.add("${date.toString()}");

                log(selectedDates.toString());
              }
            });
          },
          selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
            });
          },
          holidayPredicate: (d) {
            return false;
          },
          onFormatChanged: (CalendarFormat f) {
            setState(() {
              _calendarFormat = f;
            });
          },
          onRangeSelected: _onRangeSelected,
          rangeStartDay: _rangeState,
          rangeEndDay: _rangeEnd,
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            outsideDaysVisible: false,
            disabledDecoration:
                BoxDecoration(color: transparent, shape: BoxShape.circle),
            weekendTextStyle: GoogleFonts.workSans(color: black),
            holidayTextStyle: GoogleFonts.workSans(color: primaryColor),
            holidayDecoration: BoxDecoration(
              color: grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            selectedDecoration:
                BoxDecoration(color: primaryColor, shape: BoxShape.circle),
            rangeStartDecoration: BoxDecoration(
                color: primaryColor.withOpacity(0.4), shape: BoxShape.circle),
            rangeEndDecoration: BoxDecoration(
                color: primaryColor.withOpacity(0.4), shape: BoxShape.circle),
            rangeHighlightColor: primaryColor.withOpacity(0.4),
            rangeStartTextStyle:
                GoogleFonts.workSans(color: white, fontWeight: FontWeight.w600),
            rangeEndTextStyle:
                GoogleFonts.workSans(color: white, fontWeight: FontWeight.w600),
            selectedTextStyle: GoogleFonts.workSans(color: white),
            defaultTextStyle: GoogleFonts.workSans(color: black),
            canMarkersOverflow: false,
            markerDecoration: BoxDecoration(color: black),
            tablePadding: const EdgeInsets.all(10),
            todayDecoration: BoxDecoration(shape: BoxShape.circle),
            defaultDecoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade300),
            weekendDecoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade300),
          ),
          headerVisible: true,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            formatButtonShowsNext: false,
            headerPadding: EdgeInsets.zero,
            formatButtonDecoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            titleTextStyle:
                GoogleFonts.workSans(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  date.day.toString(),
                  style: GoogleFonts.workSans(color: white),
                )),
            todayBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.8),
                    shape: BoxShape.circle),
                child: Text(
                  date.day.toString(),
                  style: GoogleFonts.workSans(color: white),
                )),
            rangeStartBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                child: Text(
                  date.day.toString(),
                  style: GoogleFonts.workSans(color: black),
                )),
            rangeEndBuilder: (context, date, events) => Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: primaryColor, shape: BoxShape.circle),
              child: Text(
                date.day.toString(),
                style: GoogleFonts.workSans(color: black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusDay;
      _rangeState = start;
      _rangeEnd = end;
    });
    if (selectedDates.contains(start.toString()) &&
        selectedDates.contains(end.toString())) {
    } else {
      selectedDates.add(start.toString());
      selectedDates.add(end.toString());
    }

    log(selectedDates.toString());
    log(_rangeState.toString());
    log(_rangeEnd.toString());
  }
}
