import 'dart:convert';

import 'package:flutter/material.dart';
// import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:town_simulator/services/api_service.dart';

class DebugScreen extends StatefulWidget {
  const DebugScreen({super.key});

  @override
  State<DebugScreen> createState() => _DebugScreenState();
}

class _DebugScreenState extends State<DebugScreen> {
  final String baseUrl = "http://127.0.0.1:8000";
  String responseText = "No data requested yet.";
  List<dynamic> result = [];

  // GET Request Example
  Future<void> fetchWorld() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/world_info'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          result = data["npcs"];
        });
      } else {
        setState(() => responseText = "Error: ${response.statusCode}");
      }
    } catch (e) {
      setState(() => responseText = "Connection failed: $e");
    }
  }

  // Future<dynamic> Function() res = fetchWorldInfo;
  // POST Request Example
  Future<void> sendData() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/npc_info?npc_number=4'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          responseText = "Received: $data";
        });
      } else {
        setState(() => responseText = "Error: ${response.statusCode}");
      }
    } catch (e) {
      setState(() => responseText = "Connection failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + FastAPI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              responseText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: fetchWorld,
              child: const Text('get world info'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: sendData,
              child: const Text('get npc info'),
            ),
          ],
        ),
      ),
    );
  }
}
