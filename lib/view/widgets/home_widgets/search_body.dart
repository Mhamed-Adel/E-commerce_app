
import 'package:flutter/material.dart';
import 'package:test_app/controller/layout_controller/home_controller.dart';
import 'package:test_app/view/widgets/home_widgets/build_search_products.dart';

class BuildSearchItems extends StatelessWidget {
  const BuildSearchItems({
    super.key, required this.controller,
  });
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        width: double.infinity,
        height: 600,
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                BuildSearchProducts(
                  product: controller
                      .searchModel!.data.data[index],
                ),
            separatorBuilder: (context, index) =>
                const Divider(),
            itemCount: controller
                .searchModel!.data.data.length),
      );
  }
}
