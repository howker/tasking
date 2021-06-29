import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/resources/app_text_styles.dart';

class TypeTaskWidget extends StatelessWidget {
  final Color componentColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final CustomIcon icons;

  const TypeTaskWidget({
    required this.componentColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.icons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            icons,
            Text(
              text,
              style: AppTextStyles.kSFSubhead.copyWith(
                color: componentColor,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
