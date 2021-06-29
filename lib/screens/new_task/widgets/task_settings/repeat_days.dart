import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_text_styles.dart';
import 'package:wundertusk/services/providers/task_providers/new_task_provider.dart';

class RepeatDays extends StatefulWidget {
  const RepeatDays({
    Key? key,
  }) : super(key: key);

  @override
  _RepeatDaysState createState() => _RepeatDaysState();
}

class _RepeatDaysState extends State<RepeatDays> {
  final List<String> filterList = [
    'Пн',
    'Вт',
    'Ср',
    'Чт',
    'Пт',
    'Сб',
    'Вс',
  ];

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final repeatDays = context.watch<NewTaskProvider>().repeatDays;

    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      height: 32.0,
      child: ListView.builder(
        itemCount: filterList.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: ChoiceChip(
            shape: const CircleBorder(),
            label: Text(filterList[index]),
            labelStyle: AppTextStyles.kSFCaption.copyWith(
              color: repeatDays.contains(index)
                  ? AppColors.kColBackground
                  : AppColors.kColBase1,
            ),
            backgroundColor: AppColors.kColBase4,
            selectedColor: AppColors.kColAccentNormal,
            selected: repeatDays.contains(index),
            onSelected: (value) {
              value
                  ? context.read<NewTaskProvider>().addRepeatDay(index)
                  : context.read<NewTaskProvider>().removeRepeatDay(index);
            },
          ),
        ),
      ),
    );
  }
}
