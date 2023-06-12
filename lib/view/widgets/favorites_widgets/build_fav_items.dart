import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../../../controller/layout_controller/home_controller.dart';
import '../../../core/shared/components/components.dart';
import '../../../core/shared/components/constants.dart';
import '../../../models/favorites_model.dart';

class BuildFavItems extends StatelessWidget {
final  DataFavorites model;
  const BuildFavItems({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    child: Image(
                      image: NetworkImage(model.product.image.toString()),
                      height: 110,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                      child: defaultText(
                          align: TextAlign.center,
                          text: model.product.name,
                          size: 13,
                          color: Colors.black,
                          weight: FontWeight.w300),
                    ),
                     IconButton(
                        onPressed: () {
                          Get.find<HomeController>().changeFavorites(model.product.id);
                        },
                        icon: const Icon(IconlyBold.heart),
                        color: Get.find<HomeController>().favorites[model.product.id]
                            ? kdefaultColor
                            : Colors.grey,
                      ),
                    
                  ]),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      '${model.product.price} LE',
                      style: const TextStyle(
                          fontSize: 17, color: Colors.deepOrange),
                    ),
                  )
                ],
              ),
            ),
            if (model.product.oldPrice != model.product.price)
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
                        text: '${model.product.discount}%',
                        size: 15,
                        color: Colors.white),
                  )),
          ]),
        ),
      );

  }
}
