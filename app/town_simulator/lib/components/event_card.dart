import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final String event_name;
  const EventCard({
    super.key,
    required this.event_name,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      color: Color(0xff722F37),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 100,
        width: 400,
        child: Center(
          child: Text(
            widget.event_name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
