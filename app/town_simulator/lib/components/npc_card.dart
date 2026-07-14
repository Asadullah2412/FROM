import 'package:flutter/material.dart';
import 'package:town_simulator/models/npc.dart';

class Npccard extends StatefulWidget {
  // final String npc_name;
  late Future<List<NPC>> npcsFuture;

  Npccard({
    super.key,

    // required this.npc_name,
    required this.npcsFuture,

    // super.key
  });

  @override
  State<Npccard> createState() => _NpccardState();
}

class _NpccardState extends State<Npccard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<NPC>>(
        future: widget.npcsFuture,
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

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final List<NPC> npcList = snapshot.data!;

            return ListView.builder(
              itemCount: npcList.length,
              itemBuilder: (context, index) {
                final npc = npcList[index];

                return Card(
                  color: Color(0xff971B29), // Matching your white text theme
                  margin: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 4.0,
                  ),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      12,
                    ), // Keeps ripple inside card bounds
                    onTap: () {
                      // TODO: Add your click action here dialog
                      print('Clicked on ${npc.name}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        npc.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: Text(
              'No NPCs found in this world',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
