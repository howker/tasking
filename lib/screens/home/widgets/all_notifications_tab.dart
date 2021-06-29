import 'package:flutter/material.dart';

import 'package:wundertusk/screens/home/widgets/notification_item.dart';

class AllNotificationsTab extends StatelessWidget {
  const AllNotificationsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notificationsList.length,
      itemBuilder: (context, index) => notificationsList[index],
    );
  }
}
