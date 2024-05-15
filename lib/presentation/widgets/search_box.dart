import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/common/my_snacbar.dart';
import 'package:search_recipe_app_getx/controllers/search_recipe_controller.dart';
import 'package:search_recipe_app_getx/presentation/widgets/search_button.dart';
import 'package:search_recipe_app_getx/presentation/widgets/search_text_field.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';
import 'package:search_recipe_app_getx/utils/helper_functions.dart';

import 'clear_search_field_button.dart';

class SearchBox extends StatelessWidget {
  SearchBox({
    super.key,
  });

  final searchController = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: getDeviceSize(context).width,
      height: 50,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          color: secondaryColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // search btn with search icon
          // addEvent function will be called on submit or search btn click
          SearchButton(function: _addEvent),
          const SizedBox(
            width: 12,
          ),
          // text field for inserting query for recipe search
          SearchTextField(
               function: _addEvent),
          const SizedBox(
            width: 12,
          ),
          // icon btn to clear search text field
          ClearSearchFieldButton(),
        ],
      ),
    );
  }

  void _addEvent(BuildContext context) {
    String query = searchController.searchTextController.text.trim();
    if (query.isNotEmpty) {
      // if query is not empty then fetch recipes from api by add event
      searchController.searchRecipes(query);
      //BlocProvider.of<RecipeBloc>(context).add(FetchRecipeEvent(query));
    } else {
      // if query is empty after clicking submit button or search button then
      // show snackBar
      MySnackbar.showSnackbar("Please Search for Recipes",bgColor: blackColor);
     
    }
  }
}
