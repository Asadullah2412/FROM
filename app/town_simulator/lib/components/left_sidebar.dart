import 'package:flutter/material.dart';

class LeftSidebar extends StatefulWidget {
  const LeftSidebar({super.key});

  @override
  State<LeftSidebar> createState() => _LeftSidebarState();
}

class _LeftSidebarState extends State<LeftSidebar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // High-level Game State Panel
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overall Status',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const Divider(height: 16),
              // const Row( ⚠️⚠️ reconsider it
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Day',
              //           style: TextStyle(fontSize: 11, color: Colors.grey),
              //         ),
              //         Text(
              //           '5',
              //           style: TextStyle(fontSize: 18, color: Colors.green),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       children: [
              //         Text(
              //           'Time',
              //           style: TextStyle(fontSize: 11, color: Colors.grey),
              //         ),
              //         Text('Day ☀️', style: TextStyle(fontSize: 14)),
              //       ],
              //     ),
              //   ],
              // ),
              const SizedBox(height: 12),
              const Text('Escape Progress', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: 0.4,
                backgroundColor: Colors.black26,
                color: Colors.blue[600],
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '8 / 20 clues (40%)',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('Monster Location', style: TextStyle(fontSize: 12)),
              //     Text(
              //       'Hospital',
              //       style: TextStyle(
              //         color: Colors.purpleAccent,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 12,
              //       ),
              //     ),
              //   ],
              // ),⚠️⚠️ reconsider it
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Living NPCs', style: TextStyle(fontSize: 12)),
                  Text(
                    '10',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dead NPCs', style: TextStyle(fontSize: 12)),
                  Text(
                    '0',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Live NPC Roster Panel
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'All NPCs',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const Divider(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                shape: BoxShape.circle,
                              ),
                            ), // Image Blank Placeholder
                            const SizedBox(width: 8),
                            Text(
                              'npc${index + 1}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.favorite,
                              color: Colors.green,
                              size: 12,
                            ),
                            const SizedBox(width: 2),
                            const Text('80', style: TextStyle(fontSize: 11)),
                            const SizedBox(width: 6),
                            // const Icon(
                            //   Icons.shield,
                            //   color: Colors.blue,
                            //   size: 12,
                            // ),
                            // ⚠️⚠️⚠️
                            // const SizedBox(width: 2),
                            // const Text('40', style: TextStyle(fontSize: 11)),
                            const Spacer(),
                            Text(
                              '${8 - index > 0 ? 8 - index : 1} clues',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
