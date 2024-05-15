import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/controllers/search_recipe_controller.dart';

import 'package:search_recipe_app_getx/utils/colors.dart';

class ClearSearchFieldButton extends StatelessWidget {
   ClearSearchFieldButton({
    super.key,
   
  });

  final searchController = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      searchController.searchTextController.text = "";
      searchController.recipes.value = null;
    }, icon: const Icon(Icons.clear,color: whiteColor,),
      tooltip: 'Clear Search',
    );
  }
}