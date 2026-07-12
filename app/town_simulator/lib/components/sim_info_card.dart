import 'package:flutter/material.dart';
import 'package:town_simulator/models/location.dart';
import 'package:town_simulator/models/npc.dart';
import 'package:town_simulator/models/world.dart';

class SimInfoCard extends StatefulWidget {
  late Future<World> worldFuture;

  SimInfoCard({
    super.key,
    required this.worldFuture,
  });

  @override
  State<SimInfoCard> createState() => _SimInfoCardState();
}

class _SimInfoCardState extends State<SimInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<World>(
        future: widget.worldFuture,
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

          if (snapshot.hasData && snapshot.data != Null) {
            final World worldData = snapshot.data!; // replace this ⚠️⚠️⚠️
            final List<NPC> npcList = worldData.npcs;
            final List<Location> locationList = worldData.locations;

            return ListView.builder(
              itemCount: npcList.length,
              itemBuilder: (context, index) {
                final npc = npcList[index];
                return ListTile(
                  // 4. Wrap text widgets in TextStyle(color: Colors.white)
                  title: Text(
                    '$npc',
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
              'No Data found ',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
