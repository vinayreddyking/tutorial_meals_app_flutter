import 'package:flutter/material.dart';

import '../dummy_catagories.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'categoryMeals_Screen';
  // final String id;
  // final String title;
  // CategoryMealsScreen(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final catId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((itm) {
      return itm.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
