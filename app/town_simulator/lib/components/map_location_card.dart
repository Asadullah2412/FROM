import 'package:flutter/material.dart';

class MapLocationCard extends StatelessWidget {
  final String title;
  final String npcCount;
  final String occupants;
  final bool highlight;
  final bool isMonster;

  const MapLocationCard({
    super.key,
    required this.title,
    required this.npcCount,
    required this.occupants,
    this.highlight = false,
    this.isMonster = false,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.white10;
    if (highlight) borderColor = Colors.green;
    if (isMonster) borderColor = Colors.purpleAccent;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Row(
        children: [
          // Blank image wrapper placeholder
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  npcCount,
                  style: TextStyle(
                    color: isMonster ? Colors.purpleAccent : Colors.green,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  occupants,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
