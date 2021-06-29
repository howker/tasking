import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class AdditionalButtons extends StatelessWidget {
  const AdditionalButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.today,
                style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                  color: AppColors.kColAccentNormal,
                ),
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(131.0, 32.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              icon: const CustomIcon(
                color: AppColors.kColAccent2,
                customIcon: AppIcons.kIconFolderNotch,
              ),
              onPressed: () {},
              label: Expanded(
                child: Text(
                  AppLocalizations.of(context)!.title,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                    color: AppColors.kColAccent2,
                  ),
                ),
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(119.0, 32.0),
                padding: const EdgeInsets.only(left: 5.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
              icon: const CircleAvatar(radius: 14.0),
              onPressed: () {},
              label: Expanded(
                child: Text(
                  'Данил Г.',
                  style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                    color: AppColors.kColBase,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
