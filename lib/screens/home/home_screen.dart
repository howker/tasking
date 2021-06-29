import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/home/widgets/home_screen_app_bar_title.dart';
import 'package:wundertusk/services/providers/home_providers/providers.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';
import 'package:wundertusk/screens/home/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskFilterProvider(),
      child: Scaffold(
        drawer: const Menu(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const CustomIcon(
                customIcon: AppIcons.kIconMenu1,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const HomeScreenAppBarTitle(),
          actions: const <Widget>[
            NotificationButton(),
            FilterButton(),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => context.read<TaskListProvider>().loadTasksList(),
          child: Column(
            children: <Widget>[
              const Calendar(),
              Expanded(
                child: FutureBuilder<void>(
                  future: context.read<TaskListProvider>().loadTasksList(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text('Подождите, задания загружаются..'),
                            SizedBox(height: 8.0),
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }

                    return const TaskView();
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: const BottomButtons(),
        endDrawer: const NotificationsPanel(),
      ),
    );
  }
}
