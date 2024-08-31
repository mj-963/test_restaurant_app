import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_restaurant_app/widgets/terminal_list_tile.dart';
import 'package:test_restaurant_app/widgets/terminal_text_field.dart';
import '../providers/restaurant_provider.dart';

/// HomeScreen is a stateless widget that represents the main screen of the app.
/// It displays a list of restaurants with a terminal-like UI, allowing users to search for restaurants.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watches the filteredRestaurantsProvider to get the list of restaurants based on the search query.
    final restaurants = ref.watch(filteredRestaurantsProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Adds a space-themed background image.
          Image.asset(
            'assets/space_background.jpg',
            fit: BoxFit.cover,
          ),
          // Adds a blur effect to the background image.
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'RESTAURANTS   v1.0',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontFamily: 'Courier',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TerminalTextField(
                      label: 'SEARCH',
                      // Updates the search query state when the text field value changes.
                      onChanged: (value) =>
                          ref.read(searchQueryProvider.notifier).state = value,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '> RESTAURANTS LIST:',
                      style: TextStyle(
                          color: Colors.yellow, fontFamily: 'Courier'),
                    ),
                    const SizedBox(height: 10),
                    // Expanded widget to make the list take up the remaining screen space.
                    Expanded(
                      child: ListView.builder(
                        itemCount: restaurants.length,
                        // Build each restaurant item in the list.
                        itemBuilder: (context, index) {
                          final restaurant = restaurants[index];
                          // Returns a TerminalListTile widget with the restaurant details.
                          return TerminalListTile(
                            name: restaurant.name,
                            cuisine: restaurant.cuisine,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
