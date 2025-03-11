import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({required this.meal, super.key});
  final Meal meal;

  @override
  Widget build(BuildContext context, ref) {
    List<Meal> favoriteMeals = ref.watch(favoritesProvider);
    bool inFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoritesProvider.notifier)
                    .onToggleFavoriteMealsStatus(meal);
                    inFavorite = wasAdded;
                     ScaffoldMessenger.of(context).removeCurrentSnackBar();
                     ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(wasAdded?'Item Added Successfully!': 'Item Removed Successfully!')));
              },
              icon:Icon(inFavorite? Icons.star: Icons.star_border),
              )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(
              height: 10,
            ),
            ...meal.ingredients.map((e) => Text(
                  e,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                )),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(
              height: 10,
            ),
            ...meal.steps.map(
              (e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
