import 'package:flutter/material.dart';
import 'package:town_simulator/components/legend_item.dart';
import 'package:town_simulator/components/log_entry.dart';
import 'package:town_simulator/components/map_location_card.dart';

class CenterSection extends StatefulWidget {
  const CenterSection({super.key});

  @override
  State<CenterSection> createState() => _CenterSectionState();
}

class _CenterSectionState extends State<CenterSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tactical Map Grid Block
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.map, size: 16, color: Colors.green),
                    SizedBox(width: 6),
                    Text(
                      'Town Map',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(height: 16, color: Colors.white10),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.3,
                    children: const [
                      MapLocationCard(
                        title: 'Church',
                        npcCount: '1 NPC',
                        occupants: 'npc4',
                      ),
                      MapLocationCard(
                        title: 'Diner',
                        npcCount: '1 NPC',
                        occupants: 'npc1',
                        highlight: true,
                      ),
                      MapLocationCard(
                        title: 'Colony House',
                        npcCount: '2 NPCs',
                        occupants: 'npc2, npc3',
                      ),
                      MapLocationCard(
                        title: 'Barn',
                        npcCount: '1 NPC',
                        occupants: 'npc5',
                      ),
                      MapLocationCard(
                        title: 'Hospital',
                        npcCount: '2 NPCs',
                        occupants: 'npc6, npc7',
                        isMonster: true,
                      ),
                      MapLocationCard(
                        title: 'Forest',
                        npcCount: '3 NPCs',
                        occupants: 'npc8, npc9, npc10',
                      ),
                    ],
                  ),
                ),
                // Map Color Legend Row
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LegendItem(color: Colors.green, label: 'N NPCs'),
                      SizedBox(width: 24),
                      LegendItem(
                        color: Colors.purpleAccent,
                        label: 'Monster Location',
                      ),
                      SizedBox(width: 24),
                      LegendItem(color: Colors.grey, label: 'Empty Location'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Chronological History Log Block
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Event Log',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    // Filter Chips Group
                    Wrap(
                      spacing: 4,
                      children:
                          [
                            'All',
                            'Movement',
                            'Clues',
                            'Encounters',
                            'Deaths',
                          ].map((filter) {
                            final bool isSelected = filter == 'All';
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF0F172A)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.green.withValues(alpha: 0.5)
                                      : Colors.white10,
                                ),
                              ),
                              child: Text(
                                filter,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isSelected
                                      ? Colors.green
                                      : Colors.grey[400],
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
                const Divider(height: 16, color: Colors.white10),
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: const [
                      LogEntry(
                        day: 'Day 5',
                        time: '08:00',
                        text:
                            'npc1 found Receipt with hidden coded message on the back at Diner',
                      ),
                      LogEntry(
                        day: 'Day 5',
                        time: '08:02',
                        text:
                            'npc2 found Old resident list with names crossed out mysteriously at Colony House',
                      ),
                      LogEntry(
                        day: 'Day 5',
                        time: '08:04',
                        text:
                            'npc3 found Blueprint of town layout with missing exit route at Colony House',
                      ),
                      LogEntry(
                        day: 'Day 5',
                        time: '08:05',
                        text: 'npc2 shared clues with npc3',
                      ),
                      LogEntry(
                        day: 'Day 5',
                        time: '08:07',
                        text: 'npc4 failed to find anything at Church',
                        isFailure: true,
                      ),
                      LogEntry(
                        day: 'Day 5',
                        time: '08:10',
                        text:
                            'npc5 found Hanging lantern that flickers when someone lies nearby at Barn',
                      ),
                      LogEntry(
                        day: 'Day 5',
                        time: '08:12',
                        text:
                            'npc6 found Locked room with scratch marks from inside at Hospital',
                      ),
                      LogEntry(
                        day: 'Day 5',
                        time: '08:12',
                        text: 'npc6 shared clues with npc7',
                      ),
                      LogEntry(
                        day: 'Day 5',
                        time: '09:00',
                        text:
                            'Monster is in Hospital - npc6 has encountered the monster',
                        isAlert: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
