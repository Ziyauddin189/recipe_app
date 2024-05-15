import 'package:flutter/material.dart';
import 'package:search_recipe_app_getx/data/models/recipe_details_model.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipe_data_buttons_row.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipe_details_list_view.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipes_box.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';
import 'package:search_recipe_app_getx/utils/helper_functions.dart';

class RecipeDetailsBuilder extends StatelessWidget {
  const RecipeDetailsBuilder({super.key, required this.model});

  final RecipeDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              width: getDeviceSize(context).width,
              height: getDeviceSize(context).height / 2,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  // recipeBox is being used here with providing RecipeDetailsModel in constructor
                  RecipeBox(element: model),
                  const SizedBox(
                    height: 24,
                  ),
                  // row containing ingredient,steps and nutrition buttons
                   RecipeDataButtonsRow()
                ],
              )),
        ),
        Expanded(
          // show ingredients, steps or nutrition based on state
          child: RecipeDetailsListView(
            model: model,
          ),
        ),
      ],
    );
    //  );
  }
}
