import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/custom_drawer.dart';


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  

  void _setScreen(String id) {
    if (id == 'Filters') {
      setState(() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
      });
    } else {
      setState(() {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoritesProvider);
    final availableMeals = ref.watch(filteredMealsProvider);
    
    
    Widget activePage = CategoriesScreen(
      availableMeals:availableMeals
    );
    String activePageTitle = 'Pick your Category';
    if (_selectedPageIndex == 1) {
      activePage = MealScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
      drawer: CustomDrawer(onSelectScreen: _setScreen),
    );
  }
}
