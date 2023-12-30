import 'package:flutter/material.dart';

import '../../../controller/layout_controller/home_controller.dart';
import 'build_bunner.dart';

class BunnerWidget extends StatelessWidget {
  const BunnerWidget({
    super.key, required this.controller,
  });
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(
          top: 13, bottom: 13, left: 4),
      child: ListView.builder(
        controller: controller.scrollController,
        itemCount: controller
            .homeModel!.data!.banners.length,
        physics: const BouncingScrollPhysics(),
        
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            BuildBunner(
                bunner: controller.homeModel!
                    .data!.banners[index]),
      ),
    );
  }
}
