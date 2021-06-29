import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/resources/app_text_styles.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle titleStyle;

  const CustomExpansionTile({
    required this.title,
    required this.child,
    this.leading,
    this.trailing,
    this.titleStyle = AppTextStyles.kSFSubhead,
    Key? key,
  }) : super(key: key);

  @override
  CustomExpansionTileState createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  bool shouldExpand = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    shouldExpand = !shouldExpand;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      if (widget.leading != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: widget.leading,
                        ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: widget.titleStyle
                                .copyWith(color: AppColors.kColBase),
                          ),
                        ),
                      ),
                      CustomIcon(
                        customIcon: shouldExpand
                            ? AppIcons.kIconArrowUp
                            : AppIcons.kIconArrowDown,
                        color: AppColors.kColBase2,
                        width: 22.0,
                        height: 22.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (widget.trailing != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: widget.trailing,
              ),
          ],
        ),
        if (shouldExpand) widget.child,
      ],
    );
  }
}
