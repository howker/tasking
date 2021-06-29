import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';

class NewTag extends StatelessWidget {
  const NewTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                focusColor: AppColors.kColAccentNormal,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: AppLocalizations.of(context)!.addTag,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40.0),
                  primary: AppColors.kColAccentNormal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                ),
                onPressed: () {
                  context.read<TagListProvider>().createTag(
                        name: _controller.text,
                      );
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
