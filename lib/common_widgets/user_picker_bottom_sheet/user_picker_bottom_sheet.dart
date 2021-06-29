import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/common_widgets/user_picker_bottom_sheet/user_picker_bottom_sheet_provider.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/common_widgets/user_picker_bottom_sheet/user_picker_bottom_sheet_widgets.dart';
import 'package:wundertusk/repository/user/user_repository.dart';
import 'package:wundertusk/services/providers/user_providers/users_list_provider.dart';

Future<List<User>> pickUsers(
  BuildContext context, {
  List<User>? predefinedUsers,
}) async {
  final pickedUsers = await showModalBottomSheet<List<User>>(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    builder: (_) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UsersListProvider(
              context.read<UserRepository>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => UserPickerBottomSheetProvider(
              predefinedUsers: predefinedUsers,
            ),
          ),
        ],
        child: UserSelectorBottomSheet(
          alreadyPickedUsers: predefinedUsers,
        ),
      );
    },
  );

  return pickedUsers ?? <User>[];
}

class UserSelectorBottomSheet extends StatelessWidget {
  final List<User>? alreadyPickedUsers;

  const UserSelectorBottomSheet({
    this.alreadyPickedUsers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop<List<User>>(
          context,
          context.read<UserPickerBottomSheetProvider>().pickedUsers,
        );
        return false;
      },
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: TitleWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: UserSearchTextField(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: PickedUsersRowWidget(),
              ),
              AllUsersListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
