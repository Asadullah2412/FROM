import 'package:flutter/material.dart';

class Npccard extends StatefulWidget {
  final String npc_name;

  const Npccard({
    super.key,

    required this.npc_name,

    // super.key
  });

  @override
  State<Npccard> createState() => _NpccardState();
}

class _NpccardState extends State<Npccard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      color: Colors.amber[100],
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 100,
        width: 100,
        child: Text(
          widget.npc_name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
