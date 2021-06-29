import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_colors.dart';

class CustomRoundedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final Function()? onPressed;

  const CustomRoundedButton({
    required this.child,
    this.color = AppColors.kColAccentNormal,
    this.borderRadius = const BorderRadius.all(Radius.circular(45.0)),
    this.padding = const EdgeInsets.symmetric(vertical: 14.0),
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: Center(
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
