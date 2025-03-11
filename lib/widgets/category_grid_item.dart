import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  const CategoryGridItem({required this.category, super.key, required this.availableMeals});

    final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List<Meal> meals = availableMeals.where((e) => e.categories.contains(category.id)).toList();
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MealScreen(
          title: category.title,
          meals: meals,
        )));
      },
      borderRadius: BorderRadius.all(Radius.circular(15)),
      splashColor: Theme.of(context).colorScheme.onPrimary,

      child: Container(
        
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(colors: [
              category.color.withAlpha(255),
              category.color.withAlpha(150)
            ]),
          ),
          child: Text(category.title,
          style:Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,)
          ),),
    );
  }
}
