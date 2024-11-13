import 'dart:math';
import 'dart:ui';

import 'package:faker/faker.dart' as fakerRandom;
import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthCalendarPage extends CrmLayout {
  MonthCalendarPage({super.key});

  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => Colors.white;

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Month';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      // timeSlotViewSettings: TimeSlotViewSettings(
      //     numberOfDaysInView: 7,
      //     minimumAppointmentDuration: const Duration(minutes: 60)),
      dataSource: MeetingDataSource(_getDataSource()),
      // monthViewSettings: MonthViewSettings(
      //     showAgenda: false,
      //     appointmentDisplayMode: MonthAppointmentDisplayMode.none,
      //     monthCellStyle: MonthCellStyle(backgroundColor: Colors.transparent)),
      monthCellBuilder: (context, detail) {
        if (detail.appointments.isEmpty) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: CrmColors.border, width: 1),
                    top: BorderSide(color: CrmColors.border, width: 1))),
          );
        }
        dynamic item = detail.appointments.elementAtOrNull(0);
        if (item is Meeting) {
          return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: CrmColors.border, width: 1),
                    top: BorderSide(color: CrmColors.border, width: 1))),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: item.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  ImageWidget(
                    imageUrl: item.eventImg,
                    width: 32,
                    height: 32,
                    isCircle: true,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    item.eventName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: item.textColor, fontSize: 12),
                  )
                ],
              ),
            ),
          );
        }
        return Container(
          color: Colors.white,
        );
      },
      cellBorderColor: CrmColors.border,
    );
  }

  DateTime getWeekStartDate() {
    final now = DateTime.now();
    final startOfWeek = DateTime(now.year, now.month, 1);
    final daysToAdd = (startOfWeek.weekday - 1) % 7;
    return startOfWeek.subtract(Duration(days: daysToAdd));
  }

  List<Meeting> _getDataSource() {
    fakerRandom.Faker faker = fakerRandom.Faker();

    final DateTime today = getWeekStartDate();

    DateTime startTime = DateTime(today.year, today.month, today.day, 0);
    DateTime endTime = startTime.add(const Duration(hours: 23));

    final List<Meeting> meetings = List.generate(20, (i) {
      Meeting meeting;
      if (i % 2 == 0 && i % 4 != 0) {
        meeting = Meeting(
            faker.company.name(),
            startTime,
            endTime,
            Color(0xFFE4F5FF),
            true,
            Color(0xFF45B2F2),
            'https://picsum.photos/200?id=${faker.guid.guid()}');
      } else if (i % 3 == 0) {
        meeting = Meeting(
            faker.company.name(),
            startTime,
            endTime,
            Color(0xFFFFEAD3),
            true,
            Color(0xFFED9636),
            'https://picsum.photos/200?id=${faker.guid.guid()}');
      } else {
        meeting = Meeting(
            faker.company.name(),
            startTime,
            endTime,
            Color(0xFFE1F3E8),
            true,
            Color(0xFF16AC50),
            'https://picsum.photos/200?id=${faker.guid.guid()}');
      }
      startTime = startTime.add(Duration(days: 2));
      endTime = startTime.add(Duration(hours: 1));
      return meeting;
    });

    return meetings;
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
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.textColor, this.eventImg);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  Color textColor;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;

  String eventImg;
}
