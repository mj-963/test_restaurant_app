import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/restaurant.dart';
import '../services/restaurant_service.dart';

final restaurantServiceProvider = Provider((ref) => RestaurantService());

final restaurantsProvider = FutureProvider<List<Restaurant>>((ref) async {
  final restaurantService = ref.watch(restaurantServiceProvider);
  return restaurantService.fetchRestaurants();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredRestaurantsProvider = Provider<List<Restaurant>>((ref) {
  final restaurants = ref.watch(restaurantsProvider).value ?? [];
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

  if (searchQuery.isEmpty) {
    return restaurants;
  } else {
    return restaurants
        .where(
            (restaurant) => restaurant.name.toLowerCase().contains(searchQuery))
        .toList();
  }
});
