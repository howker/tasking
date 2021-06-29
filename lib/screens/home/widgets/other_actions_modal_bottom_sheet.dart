import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class OtherActionsModalBottomSheet extends StatelessWidget {
  const OtherActionsModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _ActionOption(
              title: AppLocalizations.of(context)!.listOfParticipants,
              iconAssetPath: AppIcons.kIconUserCircle,
            ),
            _ActionOption(
              title: AppLocalizations.of(context)!.addInGroup,
              iconAssetPath: AppIcons.kIconUserAdd,
            ),
            _ActionOption(
              title: AppLocalizations.of(context)!.qrCodeToAddTask,
              iconAssetPath: AppIcons.kIconQrScan,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.qrCodeGeneratorScreen,
                  arguments: '123456',
                );
              },
            ),
            _ActionOption(
              title: AppLocalizations.of(context)!.displayAsBoard,
              iconAssetPath: AppIcons.kIconKanban,
            ),
            _ActionOption(
              title: AppLocalizations.of(context)!.selectTasks,
              iconAssetPath: AppIcons.kIconCheckboxCircle,
            ),
            _ActionOption(
              title: AppLocalizations.of(context)!.actionsJournal,
              iconAssetPath: AppIcons.kIconJournal,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.actionsJournalScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionOption extends StatelessWidget {
  final String title;
  final String iconAssetPath;
  final Function()? onTap;

  const _ActionOption({
    required this.title,
    required this.iconAssetPath,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            CustomIcon(
              customIcon: iconAssetPath,
              color: AppColors.kColBase1,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.kSFBody.copyWith(
                    color: AppColors.kColBase,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
