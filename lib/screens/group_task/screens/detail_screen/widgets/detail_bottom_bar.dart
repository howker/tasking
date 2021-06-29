import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/screens/group_task/screens/detail_screen/widgets/additional_action_with_task.dart';

class DetailBottomBar extends StatefulWidget {
  final Task task;

  const DetailBottomBar({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  _DetailBottomBarState createState() => _DetailBottomBarState();
}

class _DetailBottomBarState extends State<DetailBottomBar> {
  bool isStart = false;
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.kColBGAccentButton,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  showActionWithTaskBottomSheet(context);
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.kColAccentNormal,
                ),
                color: AppColors.kColBGAccentButton,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          if (!isCompleted)
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: isStart
                      ? AppColors.kColAccent1
                      : AppColors.kColNotSuccess,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      final temp = !isStart;
                      isStart = temp;
                    });
                  },
                  icon: isStart
                      ? const CustomIcon(
                          customIcon: AppIcons.kIconStop,
                          color: Colors.white,
                        )
                      : const CustomIcon(
                          customIcon: AppIcons.kIconPlay,
                          color: Colors.white,
                        ),
                ),
              ),
            )
          else
            const SizedBox.shrink(),
          const SizedBox(width: 20.0),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppColors.kColBGAccentButton
                    : AppColors.kColAccentNormal,
                borderRadius: const BorderRadius.all(
                  Radius.circular(40.0),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    final temp = !isCompleted;
                    isCompleted = temp;
                  });
                },
                child: Text(
                  AppLocalizations.of(context)!.completeButton,
                  style: TextStyle(
                    color: isCompleted
                        ? AppColors.kColBase
                        : AppColors.kColBackground,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showActionWithTaskBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => AdditionalActionWithTask(task: widget.task),
    );
  }
}
