// npc_service.dart

// This file is responsible for everything related to NPCs.

// If your backend has endpoints like:

// Get NPC info
// Move NPC
// Feed NPC
// Change NPC fear
// Update NPC inventory

// those operations belong here.

// It understands NPC concepts and may transform the backend response into something that's easier for the rest of the app to use.

// Think of it as the "NPC expert."

//  get npc info

import 'package:town_simulator/models/npc.dart';
import 'package:town_simulator/services/api_service.dart';

var api = ApiService();

Future<List<NPC>> getNpcInfo() async {
  print("🔄 Fetching NPCs from API...");
  List<dynamic> rawData = await api.getAllNpcs();
  print("📥 Raw API Data Received: $rawData");
  // print(result);

  List<NPC> npcs = rawData.map((item) => NPC.fromMap(item)).toList();
  print("✅ Successfully mapped ${npcs.length} NPCs!");
  return npcs;
}

Future<dynamic> npcs = getNpcInfo();

// use below code only to debug and test quick features
// void main() async {
//   // Use await to get the actual data inside the Future
//   // var result = await getNpcInfo();
//   // print(result);

//   List<NPC> npcList = await getNpcInfo();
//   for (var npc in npcList) {
//     print('NPC Name: ${npc.name}, Is Dead: ${npc.isDead}');
//   }
// }

// var result = api.getAllNpcs();

// print(result);
