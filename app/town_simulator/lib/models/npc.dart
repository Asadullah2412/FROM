// "name": "npc1",
//     "age": "27",
//     "trust": 40,
//     "hunger": 20,
//     "fear": 40,
//     "intelligence": 20,
//     "clues": [],
//     "monster_sights": 0,
//     "health": 100,
//     "is_dead": false,
//     "current_location": "",
//     "npc_info": {},
//     "actions": []

class NPC {
  final String name;
  final int age;
  final int trust;
  final int hunger;
  final int fear;
  final int intelligence;
  final int monsterSights;
  final int health;
  final List clues;
  final List actions;
  final bool isDead;

  NPC({
    required this.name,
    this.actions = const [], // Default value
    this.age = 0, // Default value
    this.clues = const [], // Default value
    this.fear = 0,
    this.health = 100,
    this.hunger = 0,
    this.intelligence = 0,
    this.monsterSights = 0,
    this.trust = 0,
    this.isDead = false,
  });

  factory NPC.fromMap(Map<String, dynamic> map) {
    int toInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      return int.tryParse(value.toString()) ??
          0; // Converts String to int, defaults to 0 if it fails
    }

    return NPC(
      name: map['name'] ?? '',
      age: toInt(map['age'] ?? 0),
      trust: toInt(map['trust'] ?? 0),
      hunger: toInt(map['hunger'] ?? 0),
      fear: toInt(map['fear'] ?? 0),
      intelligence: toInt(map['intelligence'] ?? 0),
      monsterSights: toInt(map['monster_sights'] ?? 0), // Maps snake_case key
      health: toInt(map['health'] ?? 100),
      clues: List<dynamic>.from(map['clues'] ?? []),
      actions: List<dynamic>.from(map['actions'] ?? []),
      isDead: map['is_dead'] is bool
          ? map['is_dead']
          : (map['is_dead']?.toString().toLowerCase() ==
                'true'), // Maps snake_case key
    );
  }
  @override
  String toString() => name;
}
