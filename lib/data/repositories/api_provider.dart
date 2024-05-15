
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_recipe_app_getx/data/models/recipe_details_model.dart';
import 'package:search_recipe_app_getx/data/models/recipe_model.dart';
import 'package:search_recipe_app_getx/utils/strings.dart';


class ApiProvider {
  final http.Client _client;
  // api keys should be in .env file and should not be uploaded on remote repository
   final API_KEY = "f2c50cc740f54c32afcf9882cddd36ea";

  ApiProvider(this._client);

   Future<RecipeModel> searchRecipes(String query) async {

      final response = await _client.get(
        Uri.parse("$baseURL/recipes/complexSearch?apiKey=$API_KEY&query=$query"),
      );
      if(response.statusCode == 200){
        final data = json.decode(response.body);
        return RecipeModel.fromJson(data);
      }else{
        throw Exception('Failed to load recipes');
      }
  }

   Future<RecipeDetailsModel> getRecipeDetails(int recipeId) async {

      final response = await _client.get(
        Uri.parse(
            '$baseURL/recipes/$recipeId/information?apiKey=$API_KEY&includeNutrition=true&addRecipeInformation=true'),
      );
      if(response.statusCode==200){
        final data = json.decode(response.body);
        return RecipeDetailsModel.fromJson(data);
      }else{
        
        throw Exception('Failed to load recipes information');
      }
  }

  // Closes the client and cleans up any resources associated with it.
  void dispose() {
    _client.close();
  }
}