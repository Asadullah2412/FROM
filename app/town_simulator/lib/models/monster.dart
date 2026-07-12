// self.name = name

//         self.agression = agression
//         self.strength = strength
//         self.fear_Aura = fear_Aura
//         # self.victims = set()
//         self.actions = []

class Monster {
  final String name;
  final int strength;
  final int fear_Aura;

  Monster({
    required this.name,
    required this.fear_Aura,
    required this.strength,
  });

  factory Monster.fromMap(Map<String, dynamic> map) {
    int toInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      return int.tryParse(value.toString()) ??
          0; // Converts String to int, defaults to 0 if it fails
    }

    return Monster(
      name: map['name'] ?? '',
      strength: toInt(map['strength'] ?? 0),
      fear_Aura: toInt(map['fear_Aura'] ?? 0),
    );
  }
}
