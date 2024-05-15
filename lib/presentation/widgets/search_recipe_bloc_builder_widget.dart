import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/controllers/search_recipe_controller.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipes_list_widget.dart';

import 'initial_search_text.dart';
import 'loading_indicator.dart';

class SearchRecipeBuilderWidget extends StatelessWidget {
  SearchRecipeBuilderWidget({
    super.key,
  });

  final searchController = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => searchController.isLoading.value
        ? const LoadingIndicator()
        : searchController.recipes.value != null
            ? RecipesListWidget(
                recipesList: searchController.recipes.value!.results!,
              )
            : const InitialSearchText());
  }
}
