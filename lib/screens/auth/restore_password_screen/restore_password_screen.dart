import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';
import 'package:wundertusk/screens/auth/restore_password_screen/restore_password_screen_widgets.dart';

class RestorePasswordScreen extends StatelessWidget {
  const RestorePasswordScreen({
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
                  maxHeight: context.watch<ErrorStateProvider>().errorState
                      ? deviceHeight / 1.78
                      : deviceHeight / 3,
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
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
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
                          const RestoreErrorMessage(),
                          const EnterEmailByRegistration(),
                          const Spacer(),
                          const RestoreEmailField(),
                          const Spacer(),
                          const RestoreButton(),
                          const Spacer(),
                          const RememberedPasswordEnter(),
                          const Spacer(),
                          const ToRegistrationButton(),
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
