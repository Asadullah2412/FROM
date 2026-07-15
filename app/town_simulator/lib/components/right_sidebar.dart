import 'package:flutter/material.dart';

class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Selected Target Profiles Diagnostics
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
                  'Selected NPC',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const Divider(height: 16, color: Colors.white10),
                Row(
                  children: [
                    // Profile Avatar Blank Placeholder Box
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'npc1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Location: 📍 Diner',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildStatMetric('Health', 0.8, Colors.green, '80 / 100'),
                _buildStatMetric('Fear', 0.4, Colors.orange, '40 / 100'),
                _buildStatMetric('Trust', 0.5, Colors.blue, '50 / 100'),
                _buildStatMetric('intelligence', 0.5, Colors.blue, '50 / 100'),
                const SizedBox(height: 14),
                const Text(
                  'Clues Known (8)',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 6),
                // Archive Text List Area
                Container(
                  height: 110,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F172A),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          '• A journal page: They come after sundown...',
                          style: TextStyle(fontSize: 11, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          '• Coordinates scratched violently in wood',
                          style: TextStyle(fontSize: 11, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          '• Emergency radio frequency on clipboard',
                          style: TextStyle(fontSize: 11, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          '• Receipt with hidden coded message',
                          style: TextStyle(fontSize: 11, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          '• Receipt with hidden coded message',
                          style: TextStyle(fontSize: 11, color: Colors.white70),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          '• Receipt with hidden coded message',
                          style: TextStyle(fontSize: 11, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 14),
                // const Text(
                //   'Relationships',
                //   style: TextStyle(
                //     fontSize: 11,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.grey,
                //   ),
                // ),
                // const SizedBox(height: 8),
                // _buildRelationRow('npc2', 0.6, Colors.green, 'Ally'),
                // _buildRelationRow('npc3', 0.4, Colors.orange, 'Neutral'),
                // _buildRelationRow('npc6', 0.1, Colors.red, 'Does not trust'),
                // ⚠️⚠️⚠️⚠️
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Antagonist Threat Metrics Area
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
                  'Monster Info',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const Divider(height: 16, color: Colors.white10),
                Row(
                  children: [
                    // Antagonist Vector / Image Base Boundary
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.purple.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Monster',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Location: 📍 Hospital',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Strength:',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    Text(
                      '80',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fear Aura:',
                      style: TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                    Text(
                      'High',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 16, color: Colors.white10),
                const Text(
                  'Victims Seen Today',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                const Text(
                  'npc6',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Total Encounters: 4',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildStatMetric(
  String label,
  double value,
  Color color,
  String valueText,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            label,
            style: const TextStyle(fontSize: 11, color: Colors.white70),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: value,
              color: color,
              backgroundColor: Colors.black26,
              minHeight: 6,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          valueText,
          style: const TextStyle(
            fontSize: 11,
            fontFamily: 'monospace',
            color: Colors.white70,
          ),
        ),
      ],
    ),
  );
}

Widget _buildRelationRow(
  String name,
  double value,
  Color color,
  String stance,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: value,
              color: color,
              backgroundColor: Colors.black26,
              minHeight: 4,
            ),
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 85,
          child: Text(
            stance,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ),
  );
}
