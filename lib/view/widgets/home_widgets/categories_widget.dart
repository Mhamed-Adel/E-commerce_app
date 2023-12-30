import 'package:flutter/material.dart';
import 'package:test_app/controller/layout_controller/home_controller.dart';
import 'package:test_app/view/widgets/home_widgets/build_categories.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key, required this.controller,
  });
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 5),
      child: ListView.builder(
        itemBuilder: (context, index) =>
            BuildCategories(
                catModel:
                    controller.catModel!.data!,
                index: index),
        physics: const BouncingScrollPhysics(),
        itemCount: controller
            .catModel!.data!.data!.length,
        scrollDirection: Axis.horizontal,
        
      ),
    );
  }
}
