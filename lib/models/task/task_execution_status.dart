const _created = 'CREATED';
const _inProgress = 'IN_PROGRESS';
const _inWaiting = 'IN_WAITING';
const _done = 'DONE';
const _overdue = 'OVERDUE';
const _inProgressOverdue = 'IN_PROGRESS_OVERDUE';
const _inWaitingOverdue = 'IN_WAITING_OVERDUE';

enum TaskExecutionStatus {
  created,
  inProgress,
  inWaiting,
  done,
  overdue,
  inProgressOverdue,
  inWaitingOverdue,
}

extension TaskExecutionStatusX on TaskExecutionStatus {
  String toJsonString() {
    switch (this) {
      case TaskExecutionStatus.created:
        return _created;
      case TaskExecutionStatus.inProgress:
        return _inProgress;
      case TaskExecutionStatus.inWaiting:
        return _inWaiting;
      case TaskExecutionStatus.done:
        return _done;
      case TaskExecutionStatus.overdue:
        return _overdue;
      case TaskExecutionStatus.inProgressOverdue:
        return _inProgressOverdue;
      case TaskExecutionStatus.inWaitingOverdue:
        return _inWaitingOverdue;
    }
  }
}

extension StringX on String {
  TaskExecutionStatus get asTaskExecutionStatus {
    switch (this) {
      case _inProgress:
        return TaskExecutionStatus.inProgress;
      case _inWaiting:
        return TaskExecutionStatus.inWaiting;
      case _done:
        return TaskExecutionStatus.done;
      case _overdue:
        return TaskExecutionStatus.overdue;
      case _inProgressOverdue:
        return TaskExecutionStatus.inProgressOverdue;
      case _inWaitingOverdue:
        return TaskExecutionStatus.inWaitingOverdue;
      case _created:
      default:
        return TaskExecutionStatus.created;
    }
  }
}
