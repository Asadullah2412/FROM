import 'package:flutter/material.dart';
import 'package:town_simulator/components/event_card.dart';
import 'package:town_simulator/components/location_card.dart';
import 'package:town_simulator/components/monster_card.dart';
import 'package:town_simulator/components/npc_card.dart';
import 'package:town_simulator/components/sim_info_card.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(' Town Simulator'),
      //   backgroundColor: Colors.amber,
      // ),
      backgroundColor: Color(0xff25152F),
      body: SingleChildScrollView(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  'npc and monster',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Npccard(npc_name: 'npc1'),
                Npccard(npc_name: 'npc2'),
                Npccard(npc_name: 'npc3'),
                Npccard(npc_name: 'npc4'),
                Npccard(npc_name: 'npc5'),
                // Npccard(npc_name: 'Monster ')
                MonsterCard(monster_name: 'monster'),
              ],
            ),

            Column(
              children: [
                Text(
                  'Main Map of locations ',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),

                Row(
                  children: [
                    LocationCard(location_name: 'location 1'),
                    LocationCard(location_name: 'location 2'),
                    LocationCard(location_name: 'location 3'),
                  ],
                ),
                Row(
                  children: [
                    LocationCard(location_name: 'location 4'),
                    LocationCard(location_name: 'location 5'),
                    LocationCard(location_name: 'location 6'),
                  ],
                ),

                EventCard(event_name: 'Day 1 : blah blah  blah'),
                EventCard(event_name: 'Day 2 : blah blah  blah'),
                EventCard(event_name: 'Day 3 : blah blah  blah'),
              ],
            ),
            Column(
              children: [
                Text(
                  'simulation info',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SimInfoCard(world_info: 'escape status , alive , dead , etc '),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
