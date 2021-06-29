import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:wundertusk/key_packages.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final _currentDate = DateFormat('LLLL yyyy', 'ru_RU').format(DateTime.now());
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: <Widget>[
              Text(
                _currentDate,
                style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const CustomIcon(
                  customIcon: AppIcons.kIconArrowDown,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      AppLocalizations.of(context)!.today,
                      style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                        color: AppColors.kColNotSuccess,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedDay = DateTime.now();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        TableCalendar<dynamic>(
          headerVisible: false,
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2021),
          lastDay: DateTime.utc(2030),
          locale: 'ru_RU',
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarFormat: CalendarFormat.week,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selected, focused) {
            setState(() {
              _selectedDay = selected;
              _focusedDay = focused;
            });
          },
          calendarStyle: CalendarStyle(
            weekendTextStyle: const TextStyle(color: AppColors.kColBase2),
            weekendDecoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.kColDivider),
              ),
            ),
            defaultTextStyle: const TextStyle(color: AppColors.kColBase2),
            defaultDecoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.kColDivider),
              ),
            ),
            todayTextStyle: const TextStyle(color: AppColors.kColBase2),
            todayDecoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.kColDivider),
              ),
            ),
            cellMargin: EdgeInsets.zero,
            selectedTextStyle: AppTextStyles.kSFBodyMedium.copyWith(
              color: Colors.black,
            ),
            selectedDecoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.kColNotSuccess,
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  AppColors.gradientCalendar1,
                  AppColors.gradientCalendar2,
                ],
                stops: [0.5, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
