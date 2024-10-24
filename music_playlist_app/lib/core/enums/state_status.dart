enum StateStatus { init, loading, done }

extension StateStatusExtension on StateStatus {
  bool get isDone => this == StateStatus.done;
}
