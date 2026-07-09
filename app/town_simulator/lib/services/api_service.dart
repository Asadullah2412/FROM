import 'dart:convert';

import 'package:http/http.dart' as http;

// functions to get data from server
// api_service.dart

// This is the lowest-level networking layer.

// Its only responsibility is talking to your backend.

// It knows things like:

// What the base URL is.
// How to make GET, POST, PUT, DELETE requests.
// Headers.
// Authentication tokens (if you add login later).
// Timeouts and basic network errors.

class ApiService {
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

  Future<dynamic> getAllNpcs() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/all_npcs'));
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

  //
  //
  //
  //
}

// url address
