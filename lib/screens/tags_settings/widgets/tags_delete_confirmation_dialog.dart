import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';
import 'package:wundertusk/screens/tags_settings/tags_settings_screen_provider.dart';

class TagsDeleteConfirmationDialog extends StatefulWidget {
  const TagsDeleteConfirmationDialog({
    Key? key,
  }) : super(key: key);

  @override
  _TagsDeleteConfirmationDialogState createState() =>
      _TagsDeleteConfirmationDialogState();
}

class _TagsDeleteConfirmationDialogState
    extends State<TagsDeleteConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    final tagListProvider = context.read<TagListProvider>();
    final screenProvider = context.read<TagsSettingsScreenProvider>();
    final selectedTags = screenProvider.selectedTags;
    final appStrings = AppLocalizations.of(context);

    final title = selectedTags.length > 1
        ? '${appStrings!.delete} ${selectedTags.length} ${appStrings.tags}?'
        : '${appStrings!.deleteTag}: ${selectedTags[0].name}?';

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: AppTextStyles.kSFHeadline2,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.cancel,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await screenProvider.deleteSelectedTags();
                      await tagListProvider.fetchTags();
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.delete,
                      style: const TextStyle(
                        color: AppColors.kColDeleteIcon,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: AppColors.kColDeleteButton,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
