import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class TaskTagsWidget extends StatelessWidget {
  final List<String> usersTagNames;

  const TaskTagsWidget({
    required this.usersTagNames,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (usersTagNames.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Wrap(
          children: usersTagNames
              .map((tagName) => Padding(
                    padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                    child: _TaskTagWidget(groupName: tagName),
                  ))
              .toList(),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

class _TaskTagWidget extends StatelessWidget {
  final String groupName;

  const _TaskTagWidget({
    required this.groupName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          groupName,
          style: AppTextStyles.kSFCaption,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.kColBase3,
      ),
    );
  }
}
