import 'package:flutter/material.dart';

import '../dummy_catagories.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = 'category_screen';
  static const appBarText = 'Categories';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map(
            (dcData) => CategoryItem(
              id: dcData.id,
              title: dcData.title,
              color: dcData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
