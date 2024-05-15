import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/controllers/recipe_details_controller.dart';
import 'package:search_recipe_app_getx/presentation/screens/favorites_screen.dart';
import 'package:search_recipe_app_getx/presentation/widgets/error_text.dart';
import 'package:search_recipe_app_getx/presentation/widgets/favorites_controller.dart';
import 'package:search_recipe_app_getx/presentation/widgets/loading_indicator.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipe_details_bloc_provider.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final int recipeId;

  const RecipeDetailsScreen({Key? key, required this.recipeId}) : super(key: key);

  @override
  _RecipeDetailsScreenState createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  final recipeDetailsController = Get.put(RecipeDetailsController());
  final favoritesController = Get.put(FavoritesController()); // Get the instance of FavoritesController

  @override
  void initState() {
    super.initState();
    // Fetch recipe details when the screen is initialized
    recipeDetailsController.getRecipeDetails(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Add the recipe to favorites list when the favorite icon is pressed
              if (recipeDetailsController.recipeDetails.value != null) {
                favoritesController.addFavorite(recipeDetailsController.recipeDetails.value!);
                Get.to(()=>FavoritesScreen());
                // Show a snackbar or toast to indicate the recipe has been added to favorites
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added to favorites'),
                ));
              }
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() => recipeDetailsController.isLoading.value
            ? const LoadingIndicator()
            : recipeDetailsController.recipeDetails.value != null
            ? RecipeDetailsBuilder(
            model: recipeDetailsController.recipeDetails.value!)
            : const ErrorText(
          message: "No Details Available",
        )),
      ),
    );
  }
}




