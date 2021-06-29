import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class RestoreErrorMessage extends StatelessWidget {
  const RestoreErrorMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<ErrorStateProvider>().getErrorState
        ? Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.kColNotFailed,
                  ),
                  const SizedBox(width: 11),
                  Text(
                    AppLocalizations.of(context)!.error,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColNotFailed,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                AppLocalizations.of(context)!.restoreError,
                style: AppTextStyles.kSFFootnote.copyWith(
                  color: AppColors.kColBase1,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 5),
            ],
          )
        : const SizedBox.shrink();
  }
}
