import 'package:town_simulator/models/world.dart';
import 'package:town_simulator/services/api_service.dart';

var api = ApiService();

Future<World> getWorldInfo() async {
  print("🔄 Fetching World info from API...");
  Map<String, dynamic> rawData = await api.getWorldInfo();
  print("📥 Raw API Data Received: $rawData");
  // print(result);

  // List<World> worldInfo = rawData.map((item) => World.fromMap(item)).toList();
  World worldInfo = World.fromMap(rawData);
  print("✅ Successfully mapped ${worldInfo.locations} worldInfo");
  return worldInfo;
}
