import 'package:flutter/material.dart';

import 'package:wundertusk/screens/home/widgets/notification_item.dart';

class NewNotificationsTab extends StatelessWidget {
  const NewNotificationsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (final notification in notificationsList) {
      if (notification.isRead) continue;
      newNotificationsList.add(notification);
    }

    return ListView.builder(
      itemCount: newNotificationsList.length,
      itemBuilder: (_, index) => newNotificationsList[index],
    );
  }
}
