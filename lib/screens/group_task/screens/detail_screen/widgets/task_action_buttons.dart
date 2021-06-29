import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/screens/group_task/screens/detail_screen/widgets/detail_tag_button.dart';

class TaskActionButtons extends StatelessWidget {
  const TaskActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          InkResponse(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const CustomIcon(
                customIcon: AppIcons.kIconPriority,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          InkResponse(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const CustomIcon(
                customIcon: AppIcons.kIconPinIt,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          InkResponse(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const CustomIcon(
                customIcon: AppIcons.kIconTime,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: DetailTagButton(),
          ),
        ],
      ),
    );
  }
}
