import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/categories_controller.dart';

import '../../../core/shared/components/components.dart';
import '../../../core/shared/components/constants.dart';
import '../../../models/cat_datails.dart';

class BuildCatItems extends GetView<CategoryController> {
  const BuildCatItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: controller.categoryDetailModel != null,
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
      builder: (context) => GridView.count(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1 / 1.20,
          children: List.generate(
              controller.categoryDetailModel!.data!.catData.length,
              (index) => _buildItems(
                  controller.categoryDetailModel!.data!.catData[index]))),
    );
  }

  Widget _buildItems(CatData model) => InkWell(
        onTap: () {},
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            height: 215,
            width: 170,
            child: Stack(children: [
              Container(
                margin: const EdgeInsets.only(left: 7, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: CachedNetworkImage(
                        imageUrl: model.image!,
                        height: 110,
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Expanded(
                        child: defaultText(
                            align: TextAlign.center,
                            text: model.name!,
                            size: 13,
                            color: Colors.black,
                            weight: FontWeight.w300),
                      ),
                      IconButton(
                        onPressed: () {
                          // ctr.changeFavorites(model.data![index].id);
                        },
                        icon: const Icon(IconlyBold.heart),
                        // color: ctr.favorites[model.product.id] ? kdefaultColor : Colors.grey
                      )
                    ]),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        '${model.price} LE',
                        style: const TextStyle(
                            fontSize: 17, color: Colors.deepOrange),
                      ),
                    )
                  ],
                ),
              ),
              if (model.oldPrice != model.price)
                Positioned(
                    right: 10,
                    child: Container(
                      height: 45,
                      width: 35,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        color: kdefaultColor,
                      ),
                      child: defaultText(
                          align: TextAlign.center,
                          text: '${model.discount}%',
                          size: 15,
                          color: Colors.white),
                    )),
            ]),
          ),
        ),
      );
}
