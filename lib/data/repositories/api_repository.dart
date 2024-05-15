import 'package:http/http.dart';
import 'package:search_recipe_app_getx/data/models/recipe_details_model.dart';
import 'package:search_recipe_app_getx/data/models/recipe_model.dart';

import 'api_provider.dart';

class ApiRepository {

  final _provider = ApiProvider(Client());

  Future<RecipeModel> searchRecipes(String query) async {
    try {
      return await _provider.searchRecipes(query);
    } catch (e) {
      rethrow;
    }
  }

  Future<RecipeDetailsModel> getRecipeDetails(int recipeId) async {
    try {
      return await _provider.getRecipeDetails(recipeId);
    } catch (e) {
      rethrow;
    }
  }
}
