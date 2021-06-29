import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/common_widgets/user_avatar.dart';

import 'package:wundertusk/common_widgets/user_picker_bottom_sheet/user_picker_bottom_sheet_provider.dart';
import 'package:wundertusk/models/user.dart';

class PickedUsersRowWidget extends StatelessWidget {
  const PickedUsersRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarRadius = 30.0;

    // listen to picked users length to receive updates on update/delete events
    return Selector<UserPickerBottomSheetProvider, int>(
      selector: (_, provider) => provider.pickedUsers.length,
      builder: (_, __, ___) {
        // listen to the actual users list
        return Selector<UserPickerBottomSheetProvider, List<User>>(
          selector: (_, provider) => provider.pickedUsers,
          builder: (_, pickedUsers, __) {
            if (pickedUsers.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: avatarRadius * 2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: pickedUsers.length,
                    itemBuilder: (_, index) {
                      final isLastElement = index == pickedUsers.length - 1;

                      return Padding(
                        padding: EdgeInsets.only(
                          right: isLastElement ? 0.0 : 8.0,
                        ),
                        child: _PickedUserAvatar(
                          user: pickedUsers[index],
                          radius: avatarRadius,
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}

class _PickedUserAvatar extends StatelessWidget {
  final User user;
  final double radius;

  const _PickedUserAvatar({
    required this.user,
    required this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Stack(
        children: <Widget>[
          UserAvatar(
            user: user,
            radius: radius,
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                context.read<UserPickerBottomSheetProvider>().removeUser(user);
              },
              child: Container(
                width: radius * 0.8,
                height: radius * 0.8,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F7),
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.close,
                    size: 16.0,
                    color: Color(0xFF555960),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
