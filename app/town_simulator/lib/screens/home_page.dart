import 'package:flutter/material.dart';
import 'package:town_simulator/components/npc_card.dart';
import 'package:town_simulator/components/sim_info_card.dart';
import 'package:town_simulator/models/npc.dart';
import 'package:town_simulator/models/world.dart';
import 'package:town_simulator/repositories/npc_service.dart';
import 'package:town_simulator/repositories/world_service.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // try to call the functions here
  late Future<List<NPC>> npcsFuture;
  late Future<World> worldFuture;

  @override
  void initState() {
    super.initState();

    npcsFuture = getNpcInfo();
    worldFuture = getWorldInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25152F),

      body: SafeArea(
        child: Row(
          // Row1
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 2. Wrap the Column in an Expanded widget so it knows its width boundary
            // This column takes up exactly 15% of the Row's width
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  SimInfoCard(worldFuture: worldFuture),
                  Npccard(npcsFuture: npcsFuture),
                ],
              ),
            ),
            Expanded(
              flex: 85,
              child: Container(
                color: Colors.grey[200], // Temporary visual boundary
                child: const Center(child: Text('More widgets go here')),
              ),
            ),

            // If you have a second column for "Monsters" on the right,
            // wrap that column in an Expanded widget as well!
          ],
        ),
      ),
    );
  }
}
