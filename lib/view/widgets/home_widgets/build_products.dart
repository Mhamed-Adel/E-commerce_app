import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import '../../../controller/layout_controller/home_controller.dart';
import '../../../controller/layout_controller/product_controller.dart';
import '../../../core/shared/components/components.dart';
import '../../../core/shared/components/constants.dart';
import '../../../models/home_data_model.dart';

class BuildProducts extends GetView<HomeController> {
  final ProductsData product;
  const BuildProducts({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();
    return Card(
      margin: const EdgeInsets.only(left: 26, bottom: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                productController.getProductData(product.id);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, top: 8),
                child: Column(
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
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: defaultText(
                            align: TextAlign.start,
                            text: product.name,
                            size: 12,
                            color: Colors.black,
                            weight: FontWeight.w300,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.changeCart(product.id);
                          },
                          icon: const Icon(IconlyBold.bag),
                          color: controller.cart[product.id]
                              ? kdefaultColor
                              : Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${product.price}\$',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const Spacer(),
                        if (product.oldPrice != product.price)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 3,
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            child: Text(
                              '${product.discount}%',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  controller.changeFavorites(product.id);
                },
                icon: Icon(
                  IconlyBold.heart,
                  color: controller.favorites[product.id]
                      ? kdefaultColor
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
