import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          filterTile(context, 'Gluten-Free', 'Only show gluten-free meals',
              (bool value) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, value);
          }, activeFilters[Filter.glutenFree]!),
          filterTile(context, 'Lactose-Free', 'Only show lactose-free meals',
              (bool value) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, value);
          }, activeFilters[Filter.lactoseFree]!),
          filterTile(context, 'Vegetarian', 'Only show vegetarian meals',
              (bool value) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarianFree, value);
          }, activeFilters[Filter.vegetarianFree]!),
          filterTile(context, 'Vegan', 'Only show vegan meals', (bool value) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.veganFree, value);
          }, activeFilters[Filter.veganFree]!),
        ],
      ),
    );
  }

  SwitchListTile filterTile(
    BuildContext context,
    String title,
    String subtitle,
    Function(bool newValue) onChanged,
    bool filter,
  ) {
    return SwitchListTile(
      value: filter,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
