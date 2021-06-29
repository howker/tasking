import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/group_task/screens/comment_screen/comment_screen.dart';
import 'package:wundertusk/screens/group_task/screens/detail_screen/detail_screen.dart';
import 'package:wundertusk/models/comment_data.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/screens/group_task/temp_data/comments_list.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;

  const TaskDetailScreen({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  // todo временно пока не пофиксили ответ с бэка
  List<CommentData> commentList = testCommentsList;

  @override
  Widget build(BuildContext context) {
    final taskId = widget.task.id;
    return Provider(
      create: (_) => taskId,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              labelColor: AppColors.kColBase,
              labelStyle: AppTextStyles.kSFBody,
              unselectedLabelColor: AppColors.kColBase2,
              unselectedLabelStyle: AppTextStyles.kSFBody,
              indicatorColor: Colors.transparent,
              tabs: <Widget>[
                Tab(
                  text: AppLocalizations.of(context)!.taskDescription,
                ),
                Tab(
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kColBGAccentButton,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            commentList.isEmpty ? '0' : '+ ${commentList.length}',
                            style: const TextStyle(
                              color: AppColors.kColAccent2,
                            ),
                          ),
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.comment),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              DetailTab(task: widget.task),
              CommentScreen(comments: commentList),
            ],
          ),
        ),
      ),
    );
  }
}
