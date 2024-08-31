import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/restaurant.dart';
import '../services/restaurant_service.dart';

/// Provides an instance of RestaurantService to the app.
final restaurantServiceProvider = Provider((ref) => RestaurantService());

/// Fetches the list of restaurants asynchronously using RestaurantService.
/// This provider is a [FutureProvider] because it involves an asynchronous operation.
final restaurantsProvider = FutureProvider<List<Restaurant>>((ref) async {
  // Watches the restaurantServiceProvider to get an instance of RestaurantService.
  final restaurantService = ref.watch(restaurantServiceProvider);
  // Fetches the list of restaurants from the service.
  return restaurantService.fetchRestaurants();
});

/// Holds the current search query as a [String].
/// This provider is a [StateProvider] to allow easy modification of the state
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Filters the list of restaurants based on the search query.
/// This provider returns a list of restaurants that match the search query, or all restaurants if the query is empty.
final filteredRestaurantsProvider = Provider<List<Restaurant>>((ref) {
  // Gets the list of restaurants from the restaurantsProvider. If not loaded, defaults to an empty list.
  final restaurants = ref.watch(restaurantsProvider).value ?? [];
  // Gets the current search query, converted to lowercase for case-insensitive matching.
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

  // If the search query is empty, return the full list of restaurants.
  if (searchQuery.isEmpty) {
    return restaurants;
  } else {
    // Filters the restaurants based on whether their names contain the search query.

    return restaurants
        .where(
            (restaurant) => restaurant.name.toLowerCase().contains(searchQuery))
        .toList();
  }
});
