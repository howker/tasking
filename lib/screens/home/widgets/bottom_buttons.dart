import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/home/widgets/other_actions_modal_bottom_sheet.dart';
import 'package:wundertusk/screens/new_task/new_task_screen.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'btn1',
            elevation: 2,
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (_) => const OtherActionsModalBottomSheet(),
              );
            },
            backgroundColor: AppColors.kColAccentNormal,
            child: const CustomIcon(
              customIcon: AppIcons.kIconOther,
              height: 32.0,
              width: 32.0,
              color: AppColors.kColBackground,
            ),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            elevation: 2,
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                builder: (_) => const NewTaskScreen(),
              );
            },
            backgroundColor: AppColors.kColAccentNormal,
            child: const CustomIcon(
              customIcon: AppIcons.kIconAdd,
              height: 32.0,
              width: 32.0,
              color: AppColors.kColBackground,
            ),
          ),
        ],
      ),
    );
  }
}
