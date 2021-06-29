import 'package:flutter/material.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final double radius;
  final EdgeInsets padding;
  final Function()? onPressed;
  final Color? textColor;
  final Color? splashColor;

  const CustomTextButton({
    required this.text,
    this.radius = 4.0,
    this.padding = const EdgeInsets.symmetric(vertical: 4.0),
    this.onPressed,
    this.textColor,
    this.splashColor,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final resolvedTextColor = textColor ?? AppColors.kColAccentNormal;
    final resolvedSplashColor =
        splashColor ?? resolvedTextColor.withOpacity(0.25);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: resolvedSplashColor,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.kSFFootnote.copyWith(
              color: resolvedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
