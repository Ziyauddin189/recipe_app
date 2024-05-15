import 'package:flutter/material.dart';
import 'package:search_recipe_app_getx/data/models/recipe_model.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipes_box.dart';

class RecipesListWidget extends StatelessWidget {
  const RecipesListWidget({
    super.key,required this.recipesList
  });

  final List<Results> recipesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children:[
                 ...recipesList.map((e) {
                   // show each element with title, and image
                  return RecipeBox(element: e,);
                }).toList() ,
              ]
          ),
        )

    );
  }
}