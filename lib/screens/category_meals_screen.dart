import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_Meals_Screen';
  final List<Meal> dummyMealsList;
  CategoryMealsScreen(this.dummyMealsList);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool loadInitData = false;
  String categoryTitle;
  List<Meal> displayedMeal;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadInitData) {
      final Map<String, String> routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final catId = routeArgs['id'];
      displayedMeal = widget.dummyMealsList.where((itm) {
        return itm.categories.contains(catId);
      }).toList();
      loadInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            imageUrl: displayedMeal[index].imageUrl,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
            removeIt: _removeMeal,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
