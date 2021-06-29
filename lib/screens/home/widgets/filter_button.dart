import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/home_providers/providers.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: const EdgeInsets.only(right: 16.0),
      icon: const CustomIcon(customIcon: AppIcons.kIconFilter),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      offset: const Offset(-16, 56),
      onSelected: (value) {
        context.read<TaskFilterProvider>().setTaskPriority(value);
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem(
            child: Text(AppLocalizations.of(context)!.firstPriority),
            value: 'firstPriority',
          ),
          const PopupMenuDivider(height: 5.0),
          PopupMenuItem(
            child: Text(AppLocalizations.of(context)!.firstExpired),
            value: 'firstExpired',
          ),
          const PopupMenuDivider(height: 5.0),
          PopupMenuItem(
            child: Text(AppLocalizations.of(context)!.firstToday),
            value: 'firstToday',
          ),
          const PopupMenuDivider(height: 5.0),
          PopupMenuItem(
            child: Text(AppLocalizations.of(context)!.firstComing),
            value: 'firstComing',
          ),
          const PopupMenuDivider(height: 5.0),
          PopupMenuItem(
            child: Text(AppLocalizations.of(context)!.done),
            value: 'done',
          ),
        ];
      },
    );
  }
}
