import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/services/providers/group_providers/group_list_provider.dart';

class ProjectTitle extends StatelessWidget {
  const ProjectTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: context.read<GroupListProvider>().groupNameController,
      maxLength: 120,
      showCursor: false,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        //isCollapsed: true,
        contentPadding: EdgeInsets.all(12.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kColBase2),
        ),
        labelStyle: TextStyle(
          color: AppColors.kColBase2,
        ),
        labelText: 'Название',
      ),
    );
  }
}
