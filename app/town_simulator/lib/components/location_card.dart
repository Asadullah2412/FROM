import 'package:flutter/material.dart';

class LocationCard extends StatefulWidget {
  final String location_name;

  const LocationCard({
    super.key,
    required this.location_name,
  });

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
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
        height: 150,
        width: 250,
        child: Center(
          child: Text(
            widget.location_name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
