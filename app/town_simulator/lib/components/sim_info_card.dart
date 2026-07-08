import 'package:flutter/material.dart';

class SimInfoCard extends StatefulWidget {
  final String world_info;

  const SimInfoCard({
    super.key,
    required this.world_info,
  });

  @override
  State<SimInfoCard> createState() => _SimInfoCardState();
}

class _SimInfoCardState extends State<SimInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      color: Colors.purple[300],
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 350,
        width: 150,
        child: Center(
          child: Text(
            widget.world_info,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
