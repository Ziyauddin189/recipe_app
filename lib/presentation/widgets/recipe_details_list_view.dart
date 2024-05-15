import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/controllers/recipe_details_controller.dart';

import 'package:search_recipe_app_getx/data/models/recipe_details_model.dart';
import 'ingredient_column.dart';
import 'nutrition_column.dart';
import 'steps_column.dart';

class RecipeDetailsListView extends StatelessWidget {
  RecipeDetailsListView({
    super.key,
    required this.model,
  });

  final RecipeDetailsModel model;
  final recipeDetailController = Get.find<RecipeDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SingleChildScrollView(
          child: recipeDetailController.count.value == 0
              ? IngredientColumn(model: model)
              : recipeDetailController.count.value == 1
                  ? StepsColumn(model: model)
                  : NutritionColumn(model: model),
        ),
      ),
    );
  }
}
