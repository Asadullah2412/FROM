import 'dart:convert';

import 'package:http/http.dart' as http;

// functions to get data from server

// url address
final String baseUrl = "http://127.0.0.1:8000";

String responseText = "No data requested yet.";

// world info
Future<dynamic> fetchWorldInfo() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/world_info'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      return responseText;
    }
  } catch (e) {
    return "connection failed: $e";
  }
}

Future<dynamic> npcInfo(int npcNumber) async {
  try {
    final response = await http.post(
      Uri.parse('baseUrl/npc_info'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(npcNumber),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      return 'Error: ${response.statusCode}';
    }
  } catch (e) {
    return 'exception: $e';
  }
}
