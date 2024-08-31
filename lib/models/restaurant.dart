/// Model class representing a restaurant.
/// Contains basic information like ID, name, and type of cuisine.
class Restaurant {
  /// Unique identifier for the restaurant.
  final int id;

  /// Name of the restaurant.
  final String name;

  /// Type of cuisine offered by the restaurant.
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
