import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_icons.dart';

class SocialNetworksAuthWidget extends StatelessWidget {
  const SocialNetworksAuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: IconButton(
            onPressed: () {},
            icon: const CustomIcon(customIcon: AppIcons.kIconFacebook),
            iconSize: 40.0,
          ),
        ),
        Flexible(
          child: IconButton(
            onPressed: () {},
            icon: const CustomIcon(customIcon: AppIcons.kIconVK),
            iconSize: 40.0,
          ),
        ),
        Flexible(
          child: IconButton(
            onPressed: () {},
            icon: const CustomIcon(customIcon: AppIcons.kIconGoogle),
            iconSize: 40.0,
          ),
        ),
        Flexible(
          child: IconButton(
            onPressed: () {},
            icon: const CustomIcon(customIcon: AppIcons.kIconIn),
            iconSize: 40.0,
          ),
        ),
        Flexible(
          child: IconButton(
            onPressed: () {},
            icon: const CustomIcon(customIcon: AppIcons.kIconYandex),
            iconSize: 40.0,
          ),
        ),
        Flexible(
          child: IconButton(
            onPressed: () {},
            icon: const CustomIcon(customIcon: AppIcons.kIconMymir),
            iconSize: 40.0,
          ),
        ),
      ],
    );
  }
}
