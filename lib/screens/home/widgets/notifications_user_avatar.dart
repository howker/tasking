import 'package:flutter/material.dart';

class NotificationUserAvatar extends StatelessWidget {
  final String avatar;

  const NotificationUserAvatar({
    required this.avatar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 36.0,
        height: 36.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(avatar).image,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
