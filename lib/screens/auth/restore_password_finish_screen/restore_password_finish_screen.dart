import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/auth/restore_password_finish_screen/restore_password_finish_screen_widgets.dart';

class RestorePasswordFinishScreen extends StatelessWidget {
  final String secret;

  const RestorePasswordFinishScreen({
    required this.secret,
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
            const RestorePasswordFinishScreenImage(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: deviceHeight / 2.65,
                  maxWidth: deviceWidth,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Spacer(),
                          Text(
                            AppLocalizations.of(context)!.passwordRepairing,
                            style: AppTextStyles.kSFHeadline1.copyWith(
                              color: AppColors.kColBase,
                            ),
                          ),
                          const Spacer(),
                          const RestoreRegistrationPasswordField(),
                          const Spacer(),
                          const RestoreRegistrationPasswordFieldConfirm(),
                          const Spacer(),
                          ChangePasswordButton(secret: secret),
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
