import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/common/my_snacbar.dart';
import 'package:search_recipe_app_getx/data/models/recipe_model.dart';
import 'package:search_recipe_app_getx/data/repositories/api_repository.dart';
import 'package:search_recipe_app_getx/utils/helper_functions.dart';

class RecipeController extends GetxController {
  final apiRepository = ApiRepository();
  final searchTextController = TextEditingController();
  RxBool isLoading = false.obs;

  final Rx<RecipeModel?> recipes = Rx<RecipeModel?>(null);

  Future<void> searchRecipes(String query) async {
    try {
      final isConnected = await checkInternetConnection();
      if (!isConnected) {
        MySnackbar.showSnackbar('No internet connection');
        return;
      }
      isLoading(true);
      final RecipeModel result = await apiRepository.searchRecipes(query);
      recipes.value = result;
      isLoading(false);
    } catch (e) {
      MySnackbar.showSnackbar(e.toString());
      isLoading(false);
      //rethrow;
    }
  }
}
