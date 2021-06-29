import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  final String title;
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle titleStyle;

  const CustomExpansionTileWidget({
    required this.title,
    required this.child,
    this.leading,
    this.trailing,
    this.titleStyle = AppTextStyles.kSFSubhead,
    Key? key,
  }) : super(key: key);

  @override
  CustomExpansionTileWidgetState createState() =>
      CustomExpansionTileWidgetState();
}

class CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
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
