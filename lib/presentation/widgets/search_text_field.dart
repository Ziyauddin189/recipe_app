import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/controllers/search_recipe_controller.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';
import 'package:search_recipe_app_getx/utils/helper_functions.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    super.key,
    required this.function,
  });

  final Function function;
  final searchController = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getDeviceSize(context).width - 160,
      child: TextField(
        controller: searchController.searchTextController,
        style: const TextStyle(
            color: whiteColor, fontSize: 20.0, fontWeight: FontWeight.w400),
        decoration: const InputDecoration(
          hintText: "burger",
          hintStyle: TextStyle(
              color: valenciaColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w400),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onSubmitted: (value) {
          // onSubmitting call the addEvent function
          function.call(context);
        },
      ),
    );
  }
}
