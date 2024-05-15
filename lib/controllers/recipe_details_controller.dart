import 'package:get/get.dart';
import 'package:search_recipe_app_getx/common/my_snacbar.dart';
import 'package:search_recipe_app_getx/data/models/recipe_details_model.dart';
import 'package:search_recipe_app_getx/data/repositories/api_repository.dart';
import 'package:search_recipe_app_getx/utils/helper_functions.dart';

class RecipeDetailsController extends GetxController {
  final apiRepository = ApiRepository();
  RxBool isLoading = false.obs;
  // active the recipe details buttons based on even, odd and zero integer;
  RxInt count = 0.obs;

  toggleButton(int value) {
    count.value = value;
  }

  final Rx<RecipeDetailsModel?> recipeDetails = Rx<RecipeDetailsModel?>(null);

  Future<void> getRecipeDetails(int id) async {
    try {
      final isConnected = await checkInternetConnection();
      if (!isConnected) {
        MySnackbar.showSnackbar('No internet connection');
        return;
      }
      isLoading(true);
      final RecipeDetailsModel result =
          await apiRepository.getRecipeDetails(id);
      recipeDetails.value = result;
      isLoading(false);
    } catch (e) {
      MySnackbar.showSnackbar(e.toString());
      isLoading(false);
      //rethrow;
    }
  }
}
