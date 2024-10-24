extension IntExtension on int {
  // Method to get formatted duration (e.g., "1:30" for 90 seconds)
  String get getFormattedDuration {
    final minutes = (this / 60).floor();
    final seconds = this % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
