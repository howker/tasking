import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wundertusk/models/executor.dart';

import 'package:wundertusk/models/task/task_execution_status.dart';

class Task {
  final int id;
  final DateTime creationDate;
  final int creator;
  String title;
  DateTime? deadline;
  TaskExecutionStatus executionStatus;
  TaskStatus status;
  int? priority;
  List<String> userTags;
  List<Executor> executors;

  Task({
    required this.id,
    required this.title,
    required this.deadline,
    required this.creationDate,
    required this.executionStatus,
    required this.creator,
    this.status = TaskStatus.today,
    this.priority = 0,
    this.userTags = const <String>[],
    this.executors = const <Executor>[],
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as int,
        title: json['title'] as String,
        deadline: DateTime.tryParse(json['deadline'] as String? ?? ''),
        creationDate: DateTime.parse(json['creation_date'] as String),
        executionStatus: (json['status'] as String).asTaskExecutionStatus,
        creator: json['creator'] as int,
        userTags: (json['user_tags'] as List)
            .map<String>((dynamic tagString) => tagString as String)
            .toList(),
        executors: (json['executors'] as List)
            .map<Executor>((dynamic jsonExecutor) =>
                Executor.fromJson(jsonExecutor as Map<String, dynamic>))
            .toList(),
      );

  factory Task.fromResponse(http.Response response) => Task.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>,
      );

  Task copyWith({
    String? title,
    DateTime? deadline,
    TaskExecutionStatus? executionStatus,
    TaskStatus? status,
    int? priority,
  }) =>
      Task(
        id: id,
        title: title ?? this.title,
        deadline: deadline ?? this.deadline,
        executionStatus: executionStatus ?? this.executionStatus,
        creationDate: creationDate,
        status: status ?? this.status,
        priority: priority ?? this.priority,
        creator: creator,
      );
}

// enum TaskExecutionStatus {
//   created,
//   inProgress,
//   inWaiting,
//   done,
//   overdue,
//   inProgressOverdue,
//   inWaitingOverdue,
// }
//
// extension TaskExecutionStatusX on TaskExecutionStatus {
//   String toJsonString() {
//     switch (this) {
//       case TaskExecutionStatus.created:
//         return 'CREATED';
//       case TaskExecutionStatus.inProgress:
//         return 'IN_PROGRESS';
//       case TaskExecutionStatus.inWaiting:
//         return 'IN_WAITING';
//       case TaskExecutionStatus.done:
//         return 'DONE';
//       case TaskExecutionStatus.overdue:
//         return 'OVERDUE';
//       case TaskExecutionStatus.inProgressOverdue:
//         return 'IN_PROGRESS_OVERDUE';
//       case TaskExecutionStatus.inWaitingOverdue:
//         return 'IN_WAITING_OVERDUE';
//     }
//   }
// }
//
// extension StringX on String {
//   TaskExecutionStatus get asTaskExecutionStatus {
//     switch (this) {
//       case 'IN_PROGRESS':
//         return TaskExecutionStatus.inProgress;
//       case 'IN_WAITING':
//         return TaskExecutionStatus.inWaiting;
//       case 'DONE':
//         return TaskExecutionStatus.done;
//       case 'OVERDUE':
//         return TaskExecutionStatus.overdue;
//       case 'IN_PROGRESS_OVERDUE':
//         return TaskExecutionStatus.inProgressOverdue;
//       case 'IN_WAITING_OVERDUE':
//         return TaskExecutionStatus.inWaitingOverdue;
//       case 'CREATED':
//       default:
//         return TaskExecutionStatus.created;
//     }
//   }
// }

enum TaskStatus { expired, today, coming }
