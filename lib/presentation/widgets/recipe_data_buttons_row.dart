import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/controllers/recipe_details_controller.dart';
import 'package:search_recipe_app_getx/presentation/widgets/show_recipe_data_button.dart';

class RecipeDataButtonsRow extends StatelessWidget {
  RecipeDataButtonsRow({
    super.key,
  });

  final recipeDetailController = Get.find<RecipeDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ShowRecipeDataButton(
              text: "Ingredients",
              // if count is 0 then make ingredient btn active
              isActive: recipeDetailController.count.value == 0 ? true : false,
              // on clicking ingredient btn add IngredientEvent
              function: () => recipeDetailController.toggleButton(0)),
          ShowRecipeDataButton(
              text: "Steps",
              // if count is positive then make steps btn active
              isActive: recipeDetailController.count.value > 0 ? true : false,
              // on clicking steps btn add StepsEvent
              function: () => recipeDetailController.toggleButton(1)),
          ShowRecipeDataButton(
              text: "Nutrition",
              // if count is negative then make nutrition btn active
              isActive: recipeDetailController.count.value < 0 ? true : false,
              // on clicking nutrition btn add NutritionEvent
              function: () => recipeDetailController.toggleButton(-1))
        ],
      ),
    );
  }
}
