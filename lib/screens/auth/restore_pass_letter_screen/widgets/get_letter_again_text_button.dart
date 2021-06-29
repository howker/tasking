import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';

class GetLetterAgainTextButton extends StatelessWidget {
  const GetLetterAgainTextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {},
        child: Text(
          AppLocalizations.of(context)!.getLetterAgain,
          style: AppTextStyles.kSFFootnote.copyWith(
            color: AppColors.kColAccentNormal,
          ),
        ),
      ),
    );
  }
}
