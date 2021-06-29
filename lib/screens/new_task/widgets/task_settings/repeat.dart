import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/resources/app_icons.dart';

enum MenuItems { doNotRepeat, other }

class Repeat extends StatefulWidget {
  const Repeat({
    Key? key,
  }) : super(key: key);

  @override
  _RepeatState createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> {
  MenuItems repeatMode = MenuItems.other;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: AppColors.kColBase3, width: 2.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            repeatMode == MenuItems.doNotRepeat
                ? AppLocalizations.of(context)!.dontRepeat
                : AppLocalizations.of(context)!.other,
            style: AppTextStyles.kSFBody14.copyWith(fontWeight: FontWeight.w500),
          ),
          PopupMenuButton<MenuItems>(
            icon: const CustomIcon(
              customIcon: AppIcons.kIconArrowDown,
            ),
            itemBuilder: (_) => <PopupMenuEntry<MenuItems>>[
              PopupMenuItem(
                value: MenuItems.doNotRepeat,
                child: Text(AppLocalizations.of(context)!.dontRepeat),
              ),
              PopupMenuItem(
                value: MenuItems.other,
                child: Text(AppLocalizations.of(context)!.other),
              ),
            ],
            onSelected: (value) {
              setState(() {
                repeatMode = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
