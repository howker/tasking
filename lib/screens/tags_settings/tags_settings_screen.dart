import 'package:flutter/material.dart';

import 'package:wundertusk/screens/tags_settings/tags_settings_screen_widgets.dart';

class TagsSettingsScreen extends StatelessWidget {
  const TagsSettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const TagsSettingsAppBarLeading(),
        title: const TagsSettingsAppBarTitle(),
        actions: const <Widget>[
          TagsSettingsAppBarActionIcon(),
        ],
      ),
      body: const TagsSettingsBodyWidget(),
    );
  }
}
