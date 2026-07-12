//  self.name = name
//         self.clues = clues
//         self.knowledge_value = knowledge_value
//         self.danger = danger
//         self.food_supply = food_supply
//         self.neighbors = []

class Location {
  final String name;
  final int knowledgeValue;
  final int danger;
  final int foodSupply;
  // final neighbors; // might add later if needed

  Location({
    required this.name,
    this.knowledgeValue = 0,
    this.danger = 0,
    this.foodSupply = 0,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    int toInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is double) return value.toInt();
      return int.tryParse(value.toString()) ??
          0; // Converts String to int, defaults to 0 if it fails
    }

    return Location(
      name: map['name'] ?? '',
      knowledgeValue: toInt(map['knowledge_value'] ?? 0),
      danger: toInt(map['danger'] ?? 0),
      foodSupply: toInt(map['food_supply'] ?? 0),
    );
  }
  @override
  String toString() => name;
}
