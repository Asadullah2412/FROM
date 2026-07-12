// get world
// get npcs
// get locations
//
// {
//   "npcs": [
//     "npc1",
//     "npc2",
//     "npc3",
//     "npc4",
//     "npc5"
//   ],
//   "events": {},
//   "monster": [
//     "monster"
//   ],
//   "monster_victims": [],
//   "locations": [
//     "church",
//     "diner",
//     "colony house",
//     "barn",
//     "hospital",
//     "forest"
//   ],
//   "discovered_clues": 0,
//   "global_clues": 20
// }

import 'package:town_simulator/models/location.dart';
import 'package:town_simulator/models/monster.dart';
import 'package:town_simulator/models/npc.dart';

class World {
  List<NPC> npcs;
  List<Location> locations;
  List<Monster> monsters;
  List monsterVictims;
  int discoveredClues;
  int globalClues;

  World({
    required this.discoveredClues,
    required this.globalClues,
    required this.locations,
    required this.monsterVictims,
    required this.monsters,
    required this.npcs,
  });

  // map['trust'] ?? 0

  factory World.fromMap(Map<String, dynamic> map) {
    int toInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      return int.tryParse(value.toString()) ??
          0; // Converts String to int, defaults to 0 if it fails
    }

    return World(
      npcs: map['npcs'] ?? '',
      locations: map['location'] ?? '',
      globalClues: toInt(map['global_clues'] ?? 0),
      discoveredClues: toInt(map['discovered_clues'] ?? 0),
      monsterVictims: map['monster_victims'] ?? 0,
      monsters: map['monsters'],
    );
  }
}
