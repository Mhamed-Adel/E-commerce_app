import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/cart/cart_controller.dart';
import 'package:test_app/view/widgets/cart/custom_button.dart';

import '../../../controller/layout_controller/home_controller.dart';
import '../../../controller/layout_controller/product_controller.dart';
import '../../../core/shared/components/components.dart';
import '../../../core/shared/components/constants.dart';
import '../../../models/cart_model.dart';

class BuildCartsItems extends GetView<CartController> {
  final CartData model;
  final int index;

  const BuildCartsItems({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: InkWell(
        onTap: () {
          Get.put(ProductController())
              .getProductData(model.cartItems[index].product!.id);
        },
        child: Dismissible(
          direction: DismissDirection.startToEnd,
          background: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
            ),
            child: defaultText(
                text: 'Delete',
                size: 20,
                color: Colors.white,
                align: TextAlign.start),
          ),
          onDismissed: (direction) => Get.find<HomeController>()
              .changeCart(model.cartItems[index].product!.id),
          key: Key(model.cartItems[index].id.toString()),
          child: Container(
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54, blurRadius: 3, offset: Offset(1, 3))
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(left: 5, top: 10),
                    decoration: BoxDecoration(
                        color: const Color(0XFFF2F2F2),
                        borderRadius: BorderRadius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: '${model.cartItems[index].product!.image}',
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: defaultText(
                                text: '${model.cartItems[index].product!.name}',
                                size: 15,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: const Color(0XFFF0F4F4),
                                  child: GetBuilder<HomeController>(
                                    builder: (controller) =>
                                    controller.favorites.isNotEmpty ?
                                     IconButton(
                                        padding: EdgeInsets.zero,
                                        iconSize: 20,
                                        onPressed: () {
                                          controller.changeFavorites(model
                                              .cartItems[index].product!.id!);
                                        },
                                        icon: Icon(Icons.favorite_sharp,
                                            color: controller.favorites[model
                                                    .cartItems[index]
                                                    .product!
                                                    .id!]
                                                ? kdefaultColor
                                                : Colors.grey)) : const Icon(Icons.favorite_sharp),
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultText(
                                text:
                                    '${model.cartItems[index].product!.price}LE',
                                size: 15,
                                color: const Color(0XFFE49E62)),
                          ),
                          
                          CustomMaterialButton(
                            onpressed: () {
                              minusQuantity();
                            },
                            icon: Icons.remove,
                          ),
                          Text(
                            '${model.cartItems[index].quantity}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          CustomMaterialButton(
                            onpressed: () {
                              plusQuantity();
                            },
                            icon: Icons.add,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void plusQuantity() {
    controller.plusQuantity(controller.cartModel!, index);
    controller.updateCart(
        model.cartItems[index].id.toString(), controller.quantity);
  }

  void minusQuantity() {
    if (model.cartItems[index].quantity! > 1) {
      controller.minusQuantity(controller.cartModel!, index);
      controller.updateCart(
          model.cartItems[index].id.toString(), controller.quantity);
    } else {
      Get.find<HomeController>().changeCart(model.cartItems[index].product!.id);
    }
  }
}
