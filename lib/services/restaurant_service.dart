import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_restaurant_app/models/restaurant.dart';

/// Service class responsible for fetching restaurant data from a local JSON file.
class RestaurantService {
  /// Fetches the list of restaurants from the 'assets/restaurants.json' file.
  /// Returns a Future that resolves to a list of [Restaurant] objects.
  Future<List<Restaurant>> fetchRestaurants() async {
    // Loads the content of the JSON file as a string from the assets directory.
    final String response =
        await rootBundle.loadString('assets/restaurants.json');

    // Checks if the response is not empty before decoding.
    if (response.isNotEmpty) {
      // Decodes the JSON string into a dynamic list.
      final List<dynamic> data = await json.decode(response);
      // Maps the dynamic list into a list of Restaurant objects.
      return data.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      // Throws an exception if the JSON file is empty or fails to load.
      throw Exception('Failed to load restaurants');
    }
  }
}
