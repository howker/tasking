import 'package:flutter/material.dart';

import 'package:wundertusk/common_widgets/styled_divider.dart';
import 'package:wundertusk/screens/home/widgets/menu/components/components.dart';
import 'package:wundertusk/screens/home/widgets/menu/integrations.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              MenuHeader(),
              TasksGroups(),
              SizedBox(height: 8.0),
              ProjectsGroups(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: StyledDivider(),
              ),
              Filters(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: StyledDivider(),
              ),
              Integrations(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: StyledDivider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
