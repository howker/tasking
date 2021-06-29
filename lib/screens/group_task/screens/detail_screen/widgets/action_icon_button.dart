import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';

class ActionIconButton extends StatelessWidget {
  final CustomIcon icon;
  final String text;
  final Function()? onTap;

  const ActionIconButton({
    required this.icon,
    required this.text,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: AppColors.kColBase3,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
