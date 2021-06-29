import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';

class InputCommentField extends StatelessWidget {
  const InputCommentField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: AppLocalizations.of(context)!.addComment,
            suffixIcon: GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.kColBGAccentButton,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconMicro,
                    color: AppColors.kColAccent2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
