import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {this.title,
      required this.meals,
      super.key});
      
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealItem(
                meal: meal,
                onSelectedMeal: (Meal meal) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => DetailsScreen( meal: meal),
                    ),
                  );
                }))
            .toList(),
      ),
    );
  }
}
