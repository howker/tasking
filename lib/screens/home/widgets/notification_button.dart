import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
      icon: const CustomIcon(customIcon: AppIcons.kIconNotification),
    );
  }
}
