import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/common_widgets/user_avatar.dart';
import 'package:wundertusk/common_widgets/user_picker_bottom_sheet/user_picker_bottom_sheet_provider.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/services/providers/user_providers/users_list_provider.dart';

class AllUsersListWidget extends StatelessWidget {
  const AllUsersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usersListProvider = context.read<UsersListProvider>();

    return FutureBuilder<void>(
      future: _usersListProvider.loadUsersList(),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }
        final controller = ScrollController();
        controller.addListener(() {
          final endOfListReached =
              controller.offset >= controller.position.maxScrollExtent &&
                  !controller.position.outOfRange;
          if (endOfListReached) {
            _usersListProvider.tryLoadNextUsers();
          }
        });

        final users = _usersListProvider.loadedUsers;

        return Selector<UsersListProvider, int?>(
          selector: (_, provider) => provider.loadedUsers.length,
          builder: (_, length, __) {
            return Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: length,
                itemBuilder: (_, index) {
                  return _UserPickerListTile(users[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _UserPickerListTile extends StatefulWidget {
  final User user;

  const _UserPickerListTile(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  __UserPickerListTileState createState() => __UserPickerListTileState();
}

class __UserPickerListTileState extends State<_UserPickerListTile>
    with AutomaticKeepAliveClientMixin {
  late final UserPickerBottomSheetProvider _provider;

  // prevent loosing _isSelected value when its true on tile scroll out
  @override
  bool get wantKeepAlive => _isSelected;

  late bool _isSelected;

  @override
  void initState() {
    _provider = context.read<UserPickerBottomSheetProvider>();
    // this call used to receive initial value
    _isSelected = _provider.hasUser(widget.user);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // there we subscribe to all delete/add actions with the given widget.user
    _isSelected =
        context.watch<UserPickerBottomSheetProvider>().hasUser(widget.user);

    return InkWell(
      onTap: () {
        setState(() {
          _isSelected
              ? _provider.removeUser(widget.user)
              : _provider.pickUser(widget.user);
          _isSelected = _provider.hasUser(widget.user);
        });
      },
      child: ListTile(
        leading: UserAvatar(user: widget.user),
        title: Text(widget.user.fullName),
        trailing: _isSelected
            ? const Icon(Icons.check_circle, color: AppColors.kColAccentNormal)
            : const SizedBox.shrink(),
      ),
    );
  }
}
