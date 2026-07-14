import 'package:flutter/material.dart';
import 'package:town_simulator/models/world.dart';

class SimInfoCard extends StatefulWidget {
  late Future<World> worldFuture;

  SimInfoCard({
    super.key,
    required this.worldFuture,
  });

  @override
  State<SimInfoCard> createState() => _SimInfoCardState();
}

class _SimInfoCardState extends State<SimInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<World>(
        future: widget.worldFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (snapshot.hasData && snapshot.data != Null) {
            final World worldData = snapshot.data!;
            final discoveredClues = worldData.discoveredClues;
            final globalClues = worldData.globalClues;
            final String escapeStatus = '$discoveredClues / $globalClues';
            // final List<NPC> npcList = worldData.npcs;

            // final List<Location> locationList = worldData.locations;

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Escape Status : ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        letterSpacing: 0.5,
                        height: 1.4,
                      ),
                    ),
                    Text(
                      escapeStatus,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        letterSpacing: 0.5,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            );

            // },
            // );
          }

          return const Center(
            child: Text(
              'No Data found ',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
