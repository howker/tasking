import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';
import 'package:wundertusk/services/providers/task_providers/new_task_provider.dart';
import 'package:wundertusk/common_widgets/styled_divider.dart';
import 'package:wundertusk/screens/new_task/widgets/task_settings/task_settings_dialog.dart';

class AdditionalPanel extends StatelessWidget {
  const AdditionalPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: _TagButton(),
        ),
        Expanded(
          child: IconButton(
            icon: const CustomIcon(customIcon: AppIcons.kIconTime),
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                context: context,
                builder: (_) => _DeadlineElement(),
              );
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: const CustomIcon(customIcon: AppIcons.kIconPriority),
            onPressed: () {},
          ),
        ),
        Expanded(
          child: IconButton(
            icon: const CustomIcon(customIcon: AppIcons.kIconFile),
            onPressed: () {},
          ),
        ),
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const CustomIcon(customIcon: AppIcons.kIconArrowDown),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}

class _TagButton extends StatelessWidget {
  const _TagButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allTagsList =
        context.watch<TagListProvider>().tags.map((tag) => tag.name).toList();
    final taskTagsList = context.watch<NewTaskProvider>().tags;

    return PopupMenuButton<String>(
      icon: const CustomIcon(customIcon: AppIcons.kIconTag),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onSelected: (tag) {
        taskTagsList.contains(tag)
            ? context.read<NewTaskProvider>().deleteTagFromTask(tag)
            : context.read<NewTaskProvider>().addTagToTask(tag);
      },
      itemBuilder: (_) {
        return allTagsList
            .map((tag) => PopupMenuItem(
                  value: tag,
                  child: Row(
                    children: <Widget>[
                      const CustomIcon(customIcon: AppIcons.kIconTag),
                      const SizedBox(width: 16.0),
                      Text(
                        tag,
                        style: TextStyle(
                          color: taskTagsList.contains(tag)
                              ? AppColors.kColAccentActive
                              : AppColors.kColBase,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList();
      },
    );
  }
}

class _DeadlineElement extends StatelessWidget {
  final _currentDate = DateTime.now();

  _DeadlineElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)!.deadline,
              style: AppTextStyles.kSFBodyMedium.copyWith(fontSize: 14.0),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const CustomIcon(
                  customIcon: AppIcons.kIconEdit,
                ),
              ),
              Text(
                DateFormat('dd MMM.', 'ru_RU').format(_currentDate),
              ),
            ],
          ),
          const StyledDivider(),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconCalendar31,
                    color: AppColors.kColNotSuccess,
                  ),
                ),
                Text(AppLocalizations.of(context)!.today),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateFormat('E', 'ru_RU')
                          .format(_currentDate)
                          .toUpperCase(),
                      style: const TextStyle(color: AppColors.kColBase2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconCalendar,
                    color: AppColors.kColAccent3,
                  ),
                ),
                Text(AppLocalizations.of(context)!.tomorrow),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateFormat('E', 'ru_RU')
                          .format(_currentDate)
                          .toUpperCase(),
                      style: const TextStyle(color: AppColors.kColBase2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const CustomIcon(
                  customIcon: AppIcons.kIconTime,
                ),
              ),
              Text(AppLocalizations.of(context)!.noLimits),
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const CustomIcon(
                  customIcon: AppIcons.kIconRepeat,
                ),
              ),
              Text(AppLocalizations.of(context)!.repeat),
            ],
          ),
          const StyledDivider(),
          const _BottomCalendar(),
        ],
      ),
    );
  }
}

class _BottomCalendar extends StatefulWidget {
  const _BottomCalendar({
    Key? key,
  }) : super(key: key);

  @override
  __BottomCalendarState createState() => __BottomCalendarState();
}

class __BottomCalendarState extends State<_BottomCalendar> {
  final _currentDate = DateFormat('LLLL yyyy', 'ru_RU').format(DateTime.now());
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${_currentDate[0].toUpperCase()}${_currentDate.substring(1)}',
                      style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconArrowLeftBold,
                  ),
                ),
                const VerticalDivider(
                  thickness: 2.0,
                  indent: 10.0,
                  endIndent: 10.0,
                  color: AppColors.kColBase3,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconArrowRightBold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const StyledDivider(),
        const SizedBox(height: 12.0),
        TableCalendar<dynamic>(
          headerVisible: false,
          rowHeight: 40,
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2021),
          lastDay: DateTime.utc(2030),
          locale: 'ru_RU',
          startingDayOfWeek: StartingDayOfWeek.monday,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selected, focused) {
            setState(() {
              _selectedDay = selected;
              _focusedDay = focused;
            });
            showDialog<void>(
              context: context,
              builder: (_) => TaskSettingsDialog(date: selected),
            );
          },
          calendarStyle: CalendarStyle(
            weekendTextStyle: const TextStyle(color: AppColors.kColBase),
            defaultTextStyle: const TextStyle(color: AppColors.kColBase),
            todayTextStyle: const TextStyle(color: AppColors.kColBase),
            todayDecoration: const BoxDecoration(color: Colors.transparent),
            cellMargin: const EdgeInsets.all(5.0),
            selectedTextStyle:
                AppTextStyles.kSFBodyMedium.copyWith(color: Colors.white),
            selectedDecoration: const BoxDecoration(
              color: AppColors.kColAccentNormal,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
