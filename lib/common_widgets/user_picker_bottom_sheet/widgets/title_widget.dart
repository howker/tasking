import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:wundertusk/resources/app_text_styles.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            AppLocalizations.of(context)!.setExecutor,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.kSFBodyMedium,
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context)!.addInGroup,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.kSFBody,
            ),
          ),
        ),
      ],
    );
  }
}
