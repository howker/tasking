import 'package:flutter/material.dart';

import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_text_styles.dart';

class UserAvatar extends StatelessWidget {
  final User? user;
  final double radius;

  const UserAvatar({
    required this.user,
    this.radius = 20.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (user != null && user!.avatarUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        child: Image.network(
          user!.avatarUrl!,
          width: radius * 2,
          height: radius * 2,
        ),
      );
    } else {
      return CircleAvatar(
        radius: radius,
        child: Text(
          user?.fullName[0] ?? 'U',
          style: AppTextStyles.kSFTitle.copyWith(
            color: AppColors.kColBackground,
          ),
        ),
      );
    }
  }
}
