import 'package:flutter/material.dart';
import 'package:town_simulator/models/monster.dart';

class MonsterCard extends StatefulWidget {
  // final String monster_name;
  late Future<List<Monster>> monsterFuture;

  MonsterCard({
    super.key,
    // required this.monster_name,
    required this.monsterFuture,
  });

  @override
  State<MonsterCard> createState() => _MonsterCardState();
}

class _MonsterCardState extends State<MonsterCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Monster>>(
        future: widget.monsterFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final List<Monster> npcList = snapshot.data!;

            return ListView.builder(
              itemCount: npcList.length,
              itemBuilder: (context, index) {
                final npc = npcList[index];
                return ListTile(
                  // 4. Wrap text widgets in TextStyle(color: Colors.white)
                  title: Text(
                    npc.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // subtitle: Text(
                  //   // 'Age: ${npc.age} | Health: ${npc.health}',
                  //   // style: const TextStyle(color: Colors.white70),
                  // ),
                );
              },
            );
          }

          return const Center(
            child: Text(
              'No NPCs found in this world',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
