import 'package:flutter/material.dart';

import 'package:wundertusk/models/comment_data.dart';
import 'package:wundertusk/screens/group_task/screens/comment_screen/comment_screen_widgets.dart';

class CommentScreen extends StatefulWidget {
  final List<CommentData> comments;

  const CommentScreen({
    required this.comments,
    Key? key,
  }) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.comments.length,
            itemBuilder: (_, index) {
              final comment = widget.comments[index];
              return CommentCard(
                comment: comment,
                index: index,
              );
            },
          ),
        ),
        const InputCommentField(),
      ],
    );
  }
}
