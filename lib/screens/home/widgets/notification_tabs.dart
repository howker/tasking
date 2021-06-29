import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/home/widgets/all_notifications_tab.dart';
import 'package:wundertusk/screens/home/widgets/new_notifications_tab.dart';
import 'package:wundertusk/screens/home/widgets/notification_item.dart';

class NotificationTabs extends StatefulWidget {
  const NotificationTabs({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationTabsState createState() => _NotificationTabsState();
}

class _NotificationTabsState extends State<NotificationTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(
      () {
        if (!_tabController.indexIsChanging) {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            indicatorWeight: 1.0,
            indicatorColor: AppColors.kColTabBarIndicator,
            labelColor: AppColors.kColAccentNormal,
            labelStyle: AppTextStyles.kSFFootnoteAndSubhead,
            unselectedLabelColor: AppColors.kColBase2,
            tabs: <Widget>[
              Tab(
                text:
                    '${AppLocalizations.of(context)!.newNotifications}${' (${newNotificationsList.length + 1})'}',
              ),
              Tab(text: AppLocalizations.of(context)!.allNotifications),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                NewNotificationsTab(),
                AllNotificationsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
