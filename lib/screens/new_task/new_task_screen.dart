import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/services/providers/task_providers/new_task_provider.dart';
import 'package:wundertusk/common_widgets/styled_divider.dart';
import 'package:wundertusk/screens/new_task/new_task_screen_widgets.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewTaskProvider>(
      create: (_) => NewTaskProvider(),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const TaskTextField(),
            const AdditionalButtons(),
            const StyledDivider(),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const AdditionalPanel(),
            ),
          ],
        ),
      ),
    );
  }
}
