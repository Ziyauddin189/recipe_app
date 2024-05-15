import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:search_recipe_app_getx/presentation/widgets/favorites_controller.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipes_box.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController favoritesController = Get.find<FavoritesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
        backgroundColor: primaryColor,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: favoritesController.favoriteRecipes.length,
          itemBuilder: (context, index) {
            return RecipeBox(element: favoritesController.favoriteRecipes[index]);
          },
        );
      }),
    );
  }
}
