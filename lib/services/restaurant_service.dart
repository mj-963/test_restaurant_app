import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_restaurant_app/models/restaurant.dart';

class RestaurantService {
  Future<List<Restaurant>> fetchRestaurants() async {
    final String response =
        await rootBundle.loadString('assets/restaurants.json');

    if (response.isNotEmpty) {
      final List<dynamic> data = await json.decode(response);
      return data.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
