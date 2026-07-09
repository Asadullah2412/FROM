import 'package:flutter/material.dart';
import 'package:town_simulator/models/npc.dart';
import 'package:town_simulator/repositories/npc_service.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  // try to call the functions here
  late Future<List<NPC>> npcsFuture;

  @override
  void initState() {
    super.initState();

    npcsFuture = getNpcInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25152F),
      // 1. Remove SingleChildScrollView from the top level so widgets can size correctly
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 2. Wrap the Column in an Expanded widget so it knows its width boundary
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'NPC and Monster',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  // 3. Wrap FutureBuilder in an Expanded widget so ListView knows its height boundary
                  Expanded(
                    child: FutureBuilder<List<NPC>>(
                      future: npcsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                              return ListTile(
                                // 4. Wrap text widgets in TextStyle(color: Colors.white)
                                title: Text(
                                  npc.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  'Age: ${npc.age} | Health: ${npc.health}%',
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                trailing: npc.isDead
                                    ? const Icon(
                                        Icons.dangerous,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.green,
                                      ),
                              );
                            },
                          );
                        }

                        return const Center(
                          child: Text(
                            'No NPCs found in this area.',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
