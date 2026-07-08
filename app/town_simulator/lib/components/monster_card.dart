import 'package:flutter/material.dart';

class MonsterCard extends StatefulWidget {
  final String monster_name;

  const MonsterCard({
    super.key,
    required this.monster_name,
  });

  @override
  State<MonsterCard> createState() => _MonsterCardState();
}

class _MonsterCardState extends State<MonsterCard> {
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
        height: 150,
        width: 150,
        child: Center(
          child: Text(
            widget.monster_name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
