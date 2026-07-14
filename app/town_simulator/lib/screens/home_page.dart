import 'package:flutter/material.dart';
import 'package:town_simulator/components/location_card.dart';
import 'package:town_simulator/components/npc_card.dart';
import 'package:town_simulator/components/sim_info_card.dart';
import 'package:town_simulator/models/events.dart';
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
  final List<Map<String, dynamic>> locations = [
    {
      'title': 'Church',
      'npcCount': '1 NPC',
      'npcList': 'npc4',
      'isMonster': false,
    },
    {
      'title': 'Diner',
      'npcCount': '1 NPC',
      'npcList': 'npc1',
      'isMonster': false,
    },
    {
      'title': 'Colony House',
      'npcCount': '2 NPCs',
      'npcList': 'npc2, npc3',
      'isMonster': false,
    },
    {
      'title': 'Barn',
      'npcCount': '1 NPC',
      'npcList': 'npc5',
      'isMonster': false,
    },
    {
      'title': 'Hospital',
      'npcCount': '2 NPCs',
      'npcList': 'npc6, npc7',
      'isMonster': true, // Highlights purple border and skull icon
    },
    {
      'title': 'Forest',
      'npcCount': '3 NPCs',
      'npcList': 'npc8, npc9, npc10',
      'isMonster': false,
    },
  ];

  final List<EventLog> eventLogs = [
    EventLog(
      title: 'Unauthorized Login Attempt',
      description: 'IP 192.168.1.150 failed password authentication twice.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      type: LogType.danger,
    ),
    EventLog(
      title: 'Database Backup Completed',
      description:
          'Automated nightly snapshot successfully saved to cloud storage.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      type: LogType.info,
    ),
    EventLog(
      title: 'High CPU Usage Alert',
      description:
          'Processor load exceeded 92% for more than 5 consecutive minutes.',
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      type: LogType.warning,
    ),
    EventLog(
      title: 'API Rate Limit Reached',
      description:
          'Third-party weather service endpoint rejected requests with code 429.',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      type: LogType.warning,
    ),
    EventLog(
      title: 'Critical Disk Space Low',
      description:
          'Server partition /dev/sda1 has less than 2% free memory left.',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      type: LogType.danger,
    ),
    EventLog(
      title: 'User Profile Updated',
      description:
          'User ID #4092 successfully modified billing address details.',
      timestamp: DateTime.now().subtract(const Duration(hours: 8)),
      type: LogType.info,
    ),
  ];
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    Text(
                      'TOWN MAP SIMULATION',
                      style: TextStyle(
                        color: Colors.blueAccent.shade100,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Map Grid Container (Takes up remaining top space)
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF161B22,
                          ), // Dark container panel background
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Column(
                          children: [
                            // Inner layout tracking Grid Items
                            Expanded(
                              child: GridView.builder(
                                itemCount: locations
                                    .length, // Ensure your map data list is initialized
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                      childAspectRatio: 1.6,
                                    ),
                                itemBuilder: (context, index) {
                                  final item = locations[index];
                                  return LocationCard(
                                    title: item['title'],
                                    npcCount: item['npcCount'],
                                    npcList: item['npcList'],
                                    isMonster: item['isMonster'],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Footer Legend Status Row
                            const LegendRow(),
                            const SizedBox(
                              height: 16,
                            ), // Gives the UI breathing room
                            // Header for your logs
                            const Text(
                              'System Events Log',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // The scrollable events log area
                            Expanded(
                              child: ListView.builder(
                                itemCount:
                                    eventLogs.length, // Your data list variable
                                itemBuilder: (context, index) {
                                  final event = eventLogs[index];
                                  // final event = eventLogs[index];

                                  IconData icon;
                                  Color iconColor;

                                  switch (event.type) {
                                    case LogType.danger:
                                      icon = Icons.dangerous;
                                      iconColor = Colors.red;
                                      break;
                                    case LogType.warning:
                                      icon = Icons.warning_rounded;
                                      iconColor = Colors.amber;
                                      break;
                                    case LogType.info:
                                      icon = Icons.info_outline;
                                      iconColor = Colors.blue;
                                      break;
                                  }

                                  return ListTile(
                                    leading: Icon(icon, color: iconColor),
                                    title: Text(event.title),
                                    subtitle: Text(event.description),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
