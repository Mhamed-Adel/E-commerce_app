import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/cart/cart_controller.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/view/widgets/cart/build_carts_items.dart';
import '../core/shared/components/components.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    
    return Scaffold(
      appBar: AppBar(
        title: defaultText(text: 'Cart', size: 20, color: Colors.black),
      ),
      body: GetBuilder<CartController>(
        builder: (_) => Padding(
          padding: const EdgeInsets.only(top: 15),
          child: HandlingDataView(
            stateRequest: controller.stateRequest,
            widget: ConditionalBuilder(
              condition: controller.cartModel.isNotEmpty,
              fallback: (context) => const LinearProgressIndicator(),
              builder: (context) => controller
                      .cartModel.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) => BuildCartsItems(
                          model: controller.cartModel, index: index),
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.cartModel.length)
                  : Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('assets/images/souq.png'),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultText(
                            text: 'You don\'t have items in cart',
                            size: 26,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
     );
  }
}
