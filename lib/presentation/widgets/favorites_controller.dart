import 'package:get/get.dart';
import 'package:search_recipe_app_getx/data/models/recipe_details_model.dart';
import 'package:search_recipe_app_getx/data/models/recipe_model.dart';

class FavoritesController extends GetxController {
  var favoriteRecipes = <Results>[].obs;

  void addFavorite(RecipeDetailsModel recipe) {
    // Convert RecipeDetailsModel to Results and add it to favoriteRecipes
    favoriteRecipes.add(Results(
      id: recipe.id,
      title: recipe.title,
      image: recipe.image,
      imageType: '',
      // Add other properties from RecipeDetailsModel as needed
    ));
  }

  void removeFavorite(Results recipe) {
    favoriteRecipes.remove(recipe);
  }

  bool isFavorite(Results recipe) {
    return favoriteRecipes.contains(recipe);
  }
}
