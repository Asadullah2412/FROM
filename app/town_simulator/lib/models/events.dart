enum LogType { info, warning, danger }

class EventLog {
  final String title;
  final String description;
  final DateTime timestamp;
  final LogType type;

  EventLog({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.type,
  });
}
