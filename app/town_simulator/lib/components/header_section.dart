import 'package:flutter/material.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Escape the Town',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Simulation Dashboard',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          // Simulation Execution Buttons
          _buildControlGroup(),
          const Spacer(),
          // Simulation Speed Control Area
          // _buildSpeedControl(), ⚠️⚠️ reconsider it
          const SizedBox(width: 32),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Day 5',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
              Text('Time: Day ☀️', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildControlGroup() {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: const Color(0xFF0F172A),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.play_arrow_rounded, size: 16),
          label: const Text('Start'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.forward, size: 16),
          label: const Text('Next Day'),
        ),
        // TextButton.icon(
        //   onPressed: () {},
        //   icon: const Icon(Icons.fast_forward, size: 16),
        //   label: const Text('Auto (10x)'),
        // ), ⚠️⚠️ reconsider it
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.skip_next, size: 16),
          label: const Text('Skip to last day'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.refresh, size: 16, color: Colors.redAccent),
          label: const Text(
            'Reset',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    ),
  );
}
// ⚠️⚠️ reconsider it
// Widget _buildSpeedControl() {
//   return Row(
//     children: [
//       const Text(
//         'Simulation Speed',
//         style: TextStyle(fontSize: 12, color: Colors.grey),
//       ),
//       const SizedBox(width: 8),
//       SizedBox(
//         width: 120,
//         child: SliderTheme(
//           data: SliderThemeData(
//             trackHeight: 4,
//             thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
//           ),
//           child: Slider(value: 0.7, onChanged: (v) {}),
//         ),
//       ),
//       const Text('10x', style: TextStyle(fontSize: 12)),
//     ],
//   );
// }
// }

// }
