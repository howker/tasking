import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/home/widgets/notification_tabs.dart';

class NotificationsPanel extends StatelessWidget {
  const NotificationsPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: AppColors.kColBackground,
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.notifications,
                      style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                        color: AppColors.kColBase,
                      ),
                    ),
                    const CustomIcon(
                      customIcon: AppIcons.kIconCheckTwo,
                      color: AppColors.kColBase2,
                    ),
                  ],
                ),
              ),
              const NotificationTabs(),
            ],
          ),
        ),
      ),
    );
  }
}
