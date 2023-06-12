import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/home_controller.dart';

import '../../../controller/layout_controller/product_controller.dart';
import '../../../core/shared/components/components.dart';
import '../../../models/search_model.dart';

class BuildSearchProducts extends GetView<HomeController> {
  const BuildSearchProducts({super.key, required this.product});
  final SearchProduct product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        margin: const EdgeInsets.only(left: 26, bottom: 7, right: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          GestureDetector(
            onTap: () {
              ProductController ctr = Get.put(ProductController());
              ctr.getProductData(product.id);
            },
            child: Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      fadeInDuration: const Duration(seconds: 1),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline),
                      imageUrl: product.image!,
                      height: 110,
                      width: 110,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            defaultText(
                                align: TextAlign.start,
                                text: product.name!.toString(),
                                size: 12,
                                color: Colors.black,
                                weight: FontWeight.w300),
                            // IconButton(
                            //   onPressed: () {
                            //     controller.changeCart(product.id);
                            //   },
                            //   icon: const Icon(IconlyBold.bag),
                            //   color: controller.cart[product.id]
                            //       ? kdefaultColor
                            //       : Colors.grey,
                            // )
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${product.price} LE',
                              style: const TextStyle(fontSize: 17),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //   right: 0,
          //   child: IconButton(
          //     onPressed: () {
          //       controller.changeFavorites(product.id!);
          //     },
          //     icon: Icon(
          //       IconlyBold.heart,
          //       color: controller.favorites[product.id]
          //           ? kdefaultColor
          //           : Colors.grey,
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
