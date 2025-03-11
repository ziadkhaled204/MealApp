import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);
  bool onToggleFavoriteMealsStatus(Meal meal) {
    bool isInFavoriteMeals = state.contains(meal);
    if (isInFavoriteMeals) {
      state = state.where((element) => meal.id != element.id ).toList();
      return false;
    } else {
      state = [...state,meal];
      return true;
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>(
        (ref) => FavoritesMealsNotifier());
