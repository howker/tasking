import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class ExpiredTitle extends StatelessWidget {
  const ExpiredTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.expiredTitle,
          style: AppTextStyles.kSFBodyMedium.copyWith(color: AppColors.kColBase),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            AppLocalizations.of(context)!.expiredMove,
            style: AppTextStyles.kSFBody.copyWith(
              color: AppColors.kColAccentNormal,
            ),
          ),
        ),
      ],
    );
  }
}
