import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/common_widgets/user_avatar.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/resources/app_text_styles.dart';
import 'package:wundertusk/screens/home/widgets/progress_circle.dart';
import 'package:wundertusk/services/providers/user_providers/user_provider.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 45.0, 0.0, 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              UserAvatar(
                user: context.watch<UserProvider>().currentUser,
                radius: 23.0,
              ),
              // _UserAvatar(
              //   radius: 23.0,
              // ),
              const ProgressCircle(
                progressColor: AppColors.kColAccentNormal,
                progress: 0.75,
                radius: 26.0,
              ),
            ],
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                _UserFullName(),
                SizedBox(height: 6.0),
                _UserTariff(),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CustomIcon(
              customIcon: AppIcons.kIconSetting,
              width: 24.0,
              height: 24.0,
              color: AppColors.kColBase2,
            ),
          ),
        ],
      ),
    );
  }
}

class _UserFullName extends StatelessWidget {
  const _UserFullName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().currentUser;
    return Text(
      user?.fullName ?? 'User',
      style: AppTextStyles.kSFTitle,
    );
  }
}

class _UserTariff extends StatelessWidget {
  const _UserTariff({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${AppLocalizations.of(context)!.tariff}: Отсутствует',
      style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase2),
    );
  }
}
