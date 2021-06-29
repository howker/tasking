import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/auth/restore_pass_letter_screen/restore_pass_letter_screen_widgets.dart';
import 'package:wundertusk/screens/auth/restore_password_screen/widgets/restore_password_background_image.dart';

class RestorePasswordLetterScreen extends StatelessWidget {
  const RestorePasswordLetterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const RestorePasswordBackgroundImage(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: deviceHeight / 4,
                  maxWidth: deviceWidth,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  child: Container(
                    color: AppColors.kColBackground,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(),
                          Text(
                            AppLocalizations.of(context)!.passwordRepairing,
                            style: AppTextStyles.kSFHeadline1.copyWith(
                              color: AppColors.kColBase,
                            ),
                          ),
                          const Spacer(),
                          const TextLinkToRepairPassword(),
                          const Spacer(),
                          const GetLetterAgainTextButton(),
                          const Spacer(),
                        ],
                      ),
                    ),
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
