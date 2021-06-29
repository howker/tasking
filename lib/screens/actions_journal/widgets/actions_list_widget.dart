import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/actions_journal/actions_journal_screen_widgets.dart';
import 'package:wundertusk/utils/date_time_formatter.dart';

class ActionsListWidget extends StatelessWidget {
  final DateTime actionData;
  final List<ActionCardWidget> actionsList;
  const ActionsListWidget({
    required this.actionData,
    required this.actionsList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diffDt = actionData.difference(
      DateTime.now(),
    );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 23),
          Row(
            children: [
              const SizedBox(width: 4),
              if (diffDt.inHours <= -24)
                Text(
                  AppLocalizations.of(context)!.yesterdayTitle,
                  style: AppTextStyles.kSFSubhead.copyWith(
                    color: AppColors.kColBase,
                  ),
                )
              else
                Text(
                  AppLocalizations.of(context)!.todayTitle,
                  style: AppTextStyles.kSFSubhead.copyWith(
                    color: AppColors.kColBase,
                  ),
                ),
              const Icon(
                Icons.fiber_manual_record,
                size: 5,
                color: AppColors.kColBase2,
              ),
              Text(
                DateFormatter.formatToDayMonth(actionData),
                style: AppTextStyles.kSFSubhead.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: AppColors.kColDivider),
          ListView.builder(
            shrinkWrap: true,
            itemCount: actionsList.length,
            itemBuilder: (context, index) {
              return ActionCardWidget(
                action: actionsList[index].action,
                projectName: actionsList[index].projectName,
                time: actionsList[index].time,
              );
            },
          ),
        ],
      ),
    );
  }
}
