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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 2. Wrap the Column in an Expanded widget so it knows its width boundary
            Expanded(
              child: Column(
                children: [
                  Text(
                    'NPC and Monster',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Npccard(npcsFuture: npcsFuture), // npc data
                  // Npccard(npcsFuture: worldFuture), // npc data
                  SimInfoCard(worldFuture: worldFuture),
                ],
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
