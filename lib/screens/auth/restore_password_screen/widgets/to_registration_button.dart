import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class ToRegistrationButton extends StatelessWidget {
  const ToRegistrationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<ErrorStateProvider>().getErrorState
        ? Column(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.kColAccentNormal),
                  minimumSize: const Size.fromHeight(48.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutePaths.signUp1Screen,
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.toRegistration,
                  style: AppTextStyles.kSFBodyMedium.copyWith(
                    color: AppColors.kColAccentNormal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          )
        : const SizedBox.shrink();
  }
}
