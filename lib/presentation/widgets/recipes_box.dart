import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/common/my_snacbar.dart';
import 'package:search_recipe_app_getx/data/models/recipe_model.dart';
import 'package:search_recipe_app_getx/presentation/screens/recipe_details_screen.dart';
import 'package:search_recipe_app_getx/presentation/widgets/image_dialog.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipe_circular_image.dart';
import 'package:search_recipe_app_getx/presentation/widgets/recipe_text_widget.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';


class RecipeBox extends StatelessWidget {
  const RecipeBox({
    super.key,required this.element
  });

  final dynamic element;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        // recipe box is used at two different places
        // check if recipe box is being use in search screen
        onTap: element is Results ? () {
          // check if id for particular recipe is available or not
          if(element.id > 0) {
            // navigate to RecipeDetailsScreen with recipe id
            Get.to(()=>RecipeDetailsScreen(recipeId: element.id ,));
          }else{
            // if recipe id is not available then show snackBar to user
            MySnackbar.showSnackbar("Recipe Details are not available");
          }
          //  if recipe box is being use in recipe details screen
        } : (){
          showImageDialog(context, element.image,element.summary);
        },
        child: Container(
          width: 250,
          height: 240,
          decoration:  BoxDecoration(
              color: element is Results ? primaryColor : secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Column(
            children: [
              RecipeCircularImage(imageUrl: element.image),
              const SizedBox(
                height: 8,
              ),
              RecipeTextWidget(title: element.title), // recipe name
              const SizedBox(
                height: 8,
              ),
               // if recipe box is being use in search screen then on clicking the box
               // user will navigate to recipe details screen and in details screen it will
               // show the recipe image
               Text(
               element is Results ? "Click to Check Recipe" : "Click to View Image" ,
                style: const TextStyle(color: whiteColor),
              ),
            ],
          ),
        ),
      ),
    );

  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:search_recipe_app_getx/common/my_snacbar.dart';
// import 'package:search_recipe_app_getx/data/models/recipe_model.dart';
// import 'package:search_recipe_app_getx/presentation/screens/favorites_screen.dart';
// import 'package:search_recipe_app_getx/presentation/screens/recipe_details_screen.dart';
// import 'package:search_recipe_app_getx/presentation/widgets/favorites_controller.dart';
// import 'package:search_recipe_app_getx/presentation/widgets/image_dialog.dart';
// import 'package:search_recipe_app_getx/presentation/widgets/recipe_circular_image.dart';
// import 'package:search_recipe_app_getx/presentation/widgets/recipe_text_widget.dart';
// import 'package:search_recipe_app_getx/utils/colors.dart';
//
//
// class RecipeBox extends StatelessWidget {
//   RecipeBox({
//     super.key, required this.element
//   });
//
//   final dynamic element;
//   final FavoritesController favoritesController = Get.put(FavoritesController());
//
//   @override
//   Widget build(BuildContext context) {
//     bool isFavorite = favoritesController.isFavorite(element);
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: element is Results ? () {
//           if (element.id > 0) {
//             Get.to(() => RecipeDetailsScreen(recipeId: element.id));
//           } else {
//             MySnackbar.showSnackbar("Recipe Details are not available");
//           }
//         } : () {
//           showImageDialog(context, element.image, element.summary);
//         },
//         child: Container(
//           width: 250,
//           height: 240,
//           decoration: BoxDecoration(
//             color: element is Results ? primaryColor : secondaryColor,
//             borderRadius: const BorderRadius.all(Radius.circular(40)),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       if (isFavorite) {
//                         favoritesController.removeFavorite(element);
//                       } else {
//                         favoritesController.addFavorite(element);
//                       }
//                     },
//                     icon: Icon(
//                       isFavorite ? Icons.favorite : Icons.favorite_border,
//                       color: isFavorite ? Colors.red : Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               RecipeCircularImage(imageUrl: element.image),
//               const SizedBox(height: 8),
//               RecipeTextWidget(title: element.title),
//               const SizedBox(height: 8),
//               Text(
//                 element is Results ? "Click to Check Recipe" : "Click to View Image",
//                 style: const TextStyle(color: whiteColor),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
