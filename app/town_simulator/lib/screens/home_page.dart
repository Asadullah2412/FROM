import 'package:flutter/material.dart';
import 'package:town_simulator/components/center_section.dart';
import 'package:town_simulator/components/header_section.dart'
    show HeaderSection;
import 'package:town_simulator/components/left_sidebar.dart';
import 'package:town_simulator/components/right_sidebar.dart';
// import 'package:town_simulator/main.dart';
// import 'package:town_simulator/models/events.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Top Navigation Control Bar
            HeaderSection(),
            SizedBox(height: 12),
            // Main Dashboard Workspace Split
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Column: Statistics & Status
                  SizedBox(width: 240, child: LeftSidebar()),
                  SizedBox(width: 12),
                  // Middle Column: Map Layout & Event Logger
                  Expanded(flex: 3, child: CenterSection()),
                  SizedBox(width: 12),
                  // Right Column: Inspected NPC & Monster Specs
                  SizedBox(width: 300, child: RightSidebar()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
