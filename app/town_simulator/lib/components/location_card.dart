import 'package:flutter/material.dart';

class LocationCard extends StatefulWidget {
  // final String locationName;
  final String title;
  final String npcCount;
  final String npcList;
  final bool isMonster;

  const LocationCard({
    super.key,
    // this.locationName = '',
    required this.title,
    required this.npcCount,
    required this.npcList,
    required this.isMonster,
  });

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> locations = [
      {'id': '01', 'name': 'Church'},
      {'id': '02', 'name': 'Diner'},
      {'id': '03', 'name': 'Hospital'},
      {'id': '04', 'name': 'Colony House'},
      {'id': '05', 'name': 'Barn'},
      {'id': '06', 'name': 'Forest'},
    ];

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF21262D), // Distinct card color contrast
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: widget.isMonster
              ? Colors.purpleAccent
              : Colors.grey.withValues(alpha: 0.05),
          width: widget.isMonster ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Invisible image placeholder box on the left side
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: Colors.black26, // Background fill simulating image space
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 16),

          // Text metrics content on the right side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    if (widget.isMonster)
                      const Icon(
                        Icons.dangerous, // Matches monster layout icon hook
                        color: Colors.purpleAccent,
                        size: 16,
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.npcCount,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.npcList,
                  style: TextStyle(
                    fontSize: 13,
                    color: widget.isMonster
                        ? Colors.purpleAccent
                        : Colors.greenAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Map status helpers layout at the bottom
class LegendRow extends StatelessWidget {
  const LegendRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(Icons.favorite, Colors.greenAccent, 'N NPCs'),
        const SizedBox(width: 24),
        _buildLegendItem(
          Icons.dangerous,
          Colors.purpleAccent,
          'Monster Location',
        ),
        const SizedBox(width: 24),
        _buildLegendItem(Icons.circle, Colors.grey, 'Empty Location'),
      ],
    );
  }

  Widget _buildLegendItem(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(icon, color: color, size: 14),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
