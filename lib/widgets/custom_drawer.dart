import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({required this.onSelectScreen,super.key});
  final void Function(String id) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onPrimary.withAlpha(50),
                  Theme.of(context).colorScheme.onPrimary,
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Colors.white, // Ensures visibility
                ),
                const SizedBox(width: 10),
                Text(
                  'Cooking Up...',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading:Icon(Icons.restaurant, color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: const Text('Meals'),
            onTap: () {onSelectScreen('meals');},
          ),
          ListTile(
            leading: Icon(Icons.filter_list, color:Theme.of(context).colorScheme.onPrimaryContainer),
            title: const Text('Filters'),
            onTap: () {onSelectScreen('Filters');},
          ),
        ],
      ),
    );
  }
}
