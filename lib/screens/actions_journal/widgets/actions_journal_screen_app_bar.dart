import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';

class ActionsJournalScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  const ActionsJournalScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.kColBackground,
      iconTheme: const IconThemeData(color: AppColors.kColBase),
      elevation: 10.0,
      title: TextButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const CustomIcon(
          customIcon: AppIcons.kIconArrowBack,
          color: AppColors.kColBase,
        ),
        label: Text(
          AppLocalizations.of(context)!.actionsJournal,
          style: AppTextStyles.kSFHeadline2.copyWith(
            color: AppColors.kColBase,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 19.2),
          child: InkWell(
            onTap: () {},
            child: const CustomIcon(
              customIcon: AppIcons.kIconFilter,
              color: AppColors.kColBase,
            ),
          ),
        ),
      ],
    );
  }
}
