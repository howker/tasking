import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final Function()? onTap;
  final Function()? onLongPress;
  final TextStyle titleStyle;
  final Color? backgroundColor;

  const CustomListTile({
    required this.title,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.titleStyle = AppTextStyles.kSFFootnote,
    this.backgroundColor = AppColors.kColBackground,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onLongPress: onLongPress ?? () {},
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (leading != null)
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: leading,
              ),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
