class Restaurant {
  final int id;
  final String name;
  final String cuisine;

  Restaurant({required this.id, required this.name, required this.cuisine});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as int,
      name: json['name'] as String,
      cuisine: json['cuisine'] as String,
    );
  }
}
