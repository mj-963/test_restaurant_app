import 'package:flutter/material.dart';

/// A custom list tile widget styled to resemble terminal output.
/// Displays the restaurant's name, cuisine type, and index number in a terminal-like format.
class TerminalListTile extends StatelessWidget {
  final String name;
  final String cuisine;
  final int index;

  const TerminalListTile({
    super.key,
    required this.name,
    required this.cuisine,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Text(
              index.toString().padLeft(3, '0'),
              style: const TextStyle(
                fontFamily: 'Courier',
                color: Colors.green,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontFamily: 'Courier', fontSize: 14),
                children: [
                  const TextSpan(
                    text: '> ',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  TextSpan(
                    text: name.padRight(40),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const TextSpan(
                    text: '| ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: cuisine,
                    style: const TextStyle(color: Colors.cyan),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
