import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class OrTextWidget extends StatelessWidget {
  const OrTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0),
        Text(
          AppLocalizations.of(context)!.or,
          style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase2),
        ),
      ],
    );
  }
}
