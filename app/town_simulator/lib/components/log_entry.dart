import 'package:flutter/material.dart';

class LogEntry extends StatelessWidget {
  final String day;
  final String time;
  final String text;
  final bool isAlert;
  final bool isFailure;

  const LogEntry({
    super.key,
    required this.day,
    required this.time,
    required this.text,
    this.isAlert = false,
    this.isFailure = false,
  });

  @override
  Widget build(BuildContext context) {
    Color txtColor = Colors.white70;
    if (isAlert) txtColor = Colors.purpleAccent;
    if (isFailure) txtColor = Colors.white38;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$day $time',
            style: const TextStyle(
              color: Colors.green,
              fontSize: 11,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 11, color: txtColor, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}
