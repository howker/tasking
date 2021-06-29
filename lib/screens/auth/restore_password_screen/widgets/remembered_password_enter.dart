import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/error_state_provider.dart';
import 'package:provider/provider.dart';

class RememberedPasswordEnter extends StatelessWidget {
  const RememberedPasswordEnter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<ErrorStateProvider>().getErrorState
        ? const SizedBox.shrink()
        : SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.remembedPassword,
                  style: AppTextStyles.kSFFootnote.copyWith(
                    color: AppColors.kColBase1,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutePaths.loginScreen,
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.signIn,
                    style: AppTextStyles.kSFFootnote.copyWith(
                      color: AppColors.kColAccentNormal,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
