import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/screens/group_task/screens/detail_screen/widgets/type_task_widet.dart';

class DateAndGroup extends StatelessWidget {
  const DateAndGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: const <Widget>[
          TypeTaskWidget(
            componentColor: AppColors.kColNotSuccess,
            backgroundColor: Colors.white,
            text: 'Сегодня',
            icons: CustomIcon(
              customIcon: AppIcons.kIconCalendar,
            ),
            borderColor: Colors.black12,
          ),
          SizedBox(width: 8.0),
          TypeTaskWidget(
            componentColor: Colors.blueAccent,
            backgroundColor: AppColors.kColBGAccentButton,
            text: 'Auditor.pro',
            icons: CustomIcon(
              customIcon: AppIcons.kIconFile,
            ),
            borderColor: AppColors.kColBGAccentButton,
          ),
        ],
      ),
    );
  }
}
