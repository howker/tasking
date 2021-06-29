import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wundertusk/common_widgets/user_avatar.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/resources/app_text_styles.dart';

class UserCard extends StatefulWidget {
  final User user;
  final Widget? subtitle;
  final Widget? trailing;

  const UserCard({
    required this.user,
    this.subtitle,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool isChoose = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        UserAvatar(user: widget.user),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.user.fullName,
                style: AppTextStyles.kSFBody.copyWith(color: Colors.black),
              ),
              if (widget.subtitle != null) ...{
                const SizedBox(height: 4.0),
                widget.subtitle!,
              },
            ],
          ),
        ),
        if (widget.trailing != null) widget.trailing!,
      ],
    );
  }
}

class UserShimmerCard extends StatelessWidget {
  const UserShimmerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: <Widget>[
          const CircleAvatar(),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Загрузка',
                  style: AppTextStyles.kSFBody.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
