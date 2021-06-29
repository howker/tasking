import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/home/widgets/notifications_user_avatar.dart';

class NotificationItem extends StatelessWidget {
  final String notificationText;
  final String data;
  final bool isRead;
  final String avatar;
  final String userName;
  final String projectName;

  const NotificationItem({
    required this.notificationText,
    required this.data,
    required this.isRead,
    required this.avatar,
    required this.userName,
    required this.projectName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isRead ? AppColors.kColBackground : AppColors.kColBase4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                NotificationUserAvatar(avatar: avatar),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: userName != '' ? '$userName ' : '',
                          style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kColBase,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '$notificationText ',
                              style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: projectName,
                              style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            data,
                            style: AppTextStyles.kSFCaption
                                .copyWith(color: AppColors.kColBase2),
                          ),
                          if (isRead)
                            Text(
                              'Прочитано',
                              style: AppTextStyles.kSFCaption.copyWith(
                                color: AppColors.kColBase2,
                              ),
                            )
                          else
                            const Text(''),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.kColDivider),
        ],
      ),
    );
  }
}

List<NotificationItem> notificationsList = const [
  NotificationItem(
    avatar: 'assets/images/avatar1.png',
    data: '19 апр. ',
    isRead: false,
    notificationText: 'добавил комментарий к проекту',
    projectName: 'AuditorPro',
    userName: 'pavelantipov39',
  ),
  NotificationItem(
    avatar: 'assets/images/avatar2.png',
    data: '19 апр. ',
    isRead: true,
    notificationText: 'Вы присоединились к проекту',
    projectName: 'AuditorPro',
    userName: '',
  ),
  NotificationItem(
    avatar: 'assets/images/avatar2.png',
    data: '16 апр. ',
    isRead: true,
    notificationText: 'Вы присоединились к проекту',
    projectName: 'Колледж',
    userName: '',
  ),
];

List<NotificationItem> newNotificationsList = [];
