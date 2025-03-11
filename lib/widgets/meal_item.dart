import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal,required this.onSelectedMeal, super.key});
  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;

  String get complexityText
  {
    switch(meal.complexity)
    {
      case Complexity.simple: return 'simple' ;
      case Complexity.challenging: return 'challenging' ;
      case Complexity.hard: return 'hard' ;
    }
  }
  String get affordabilityText
  {
    switch(meal.affordability)
    {
      case Affordability.affordable: return 'affordable' ;
      case Affordability.luxurious: return 'luxurious' ;
      case Affordability.pricey: return 'pricey' ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       onSelectedMeal(meal);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(10),
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Column(
          children:[Stack(
            children: [
              FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
              Positioned(
                bottom: 40,
                right: 0,
                left: 200,
                child: Container(
                  color: Colors.black26,
                  child: Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
          
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
              
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_alarm),
                    const SizedBox(width: 6,),
                    Text('${meal.duration} min',
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.local_activity),
                    const SizedBox(width: 6,),
                    Text(complexityText,
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money_outlined),
                    const SizedBox(width: 6,),
                    Text(affordabilityText,
                    style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
