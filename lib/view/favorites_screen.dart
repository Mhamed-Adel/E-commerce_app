import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/favorites_controller.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/view/widgets/favorites_widgets/build_fav_items.dart';
import '../core/shared/components/components.dart';

class FavoritesScreen extends GetView<FavoritesController>{
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController());
    return GetBuilder<FavoritesController>(
      builder: (c) => HandlingDataView(
        stateRequest: controller.stateRequest!,
        widget: ConditionalBuilder(
          condition: controller.favoritesModel != null,
          fallback: (context) => const Center(
              child: LinearProgressIndicator()),
          builder: (context) => controller.favoritesModel!.data.data.isNotEmpty
              ? Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 1 / 1.20,
                        children: List.generate(
                            controller.favoritesModel!.data.data.length,
                            (index) {
                          return BuildFavItems(
                            model:controller.favoritesModel!.data.data[index]);
                        }),
                      ),
                    ),
                  )
                ],
              )
              : Center(
                  child: defaultText(text: 'No Items in Favorites', size: 24)
                      .animate()
                      .fade()
                      .slideY(
                          delay: const Duration(milliseconds: 400),
                          duration: const Duration(milliseconds: 500))),
        ),
      ),
    );
  }

}
