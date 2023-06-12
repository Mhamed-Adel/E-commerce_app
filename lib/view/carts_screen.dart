// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_app/controller/layout_controller/cart_controller.dart';
// import 'package:test_app/core/functions/handle_dataview.dart';
// import 'package:test_app/view/widgets/build_carts_items.dart';

// import '../core/shared/components/components.dart';

// class CartScreen extends GetView<CartController> {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(CartController());
//     return Scaffold(
//       appBar: AppBar(
//         title: defaultText(text: 'Cart', size: 20, color: Colors.black),
//       ),
//       body: GetBuilder<CartController>(
//         builder: (_) => Padding(
//           padding: const EdgeInsets.only(top: 15),
//           child: HandlingDataView(
//             stateRequest: controller.stateRequest,
//             widget: ConditionalBuilder(
//               condition: controller.cartModel != null,
//               fallback: (context) => const LinearProgressIndicator(),
//               builder: (context) => controller
//                       .cartModel!.data!.cartItems.isNotEmpty
//                   ? ListView.builder(
//                       itemBuilder: (context, index) => BuildCartsItems(
//                           model: controller.cartModel!.data!, index: index),
//                       physics:const BouncingScrollPhysics(),
//                       itemCount: controller.cartModel!.data!.cartItems.length)
//                   : Container(
//                       color: Colors.amber,
//                       child:const Center(
//                         child: Text(
//                           'You don\'t have items in cart',
//                         ),
//                       ),
//                     ),
//             ),
//           ),
//         ),
//       ),
//       persistentFooterButtons: [
//         GetBuilder<CartController>(
//           builder: (_) {
//             return controller.cartModel == null
//                 ? Container(
//                     height: 0,
//                   )
//                 : Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         defaultText(
//                             text: 'Order Summary',
//                             weight: FontWeight.w400,
//                             size: 18,
//                             color: const Color(0xFF264446)),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(children: [
//                           defaultText(
//                               text: 'Subtotal',
//                               weight: FontWeight.w400,
//                               size: 18,
//                               color: const Color(0xFF264446)),
//                           const Spacer(),
//                           defaultText(
//                               text: controller.cartModel!.data!.subTotal
//                                   .toString(),
//                               weight: FontWeight.w400,
//                               size: 18,
//                               color: const Color(0xFFE49E62)),
//                         ]),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         defaultText(
//                             text: 'Shipping',
//                             weight: FontWeight.w400,
//                             size: 18,
//                             color: const Color(0xFF264446)),
//                         const Divider(),
//                         Row(

//                           children: [
//                             defaultText(
//                                 text: 'Total Payment',
//                                 weight: FontWeight.w400,
//                                 size: 18,
//                                 color: const Color(0xFF264446)),
//                             const Spacer(),
//                             defaultText(
//                                 text: controller.cartModel!.data!.total
//                                     .toString(),
//                                 weight: FontWeight.w400,
//                                 size: 18,
//                                 color: const Color(0xFFE49E62)),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         defaultButton(
//                           onPress: () {},
//                           text: 'CheckOut',
//                         )
//                       ],
//                     ),
//                   );
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/cart_controller.dart';
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
              condition: controller.cartModel != null,
              fallback: (context) => const LinearProgressIndicator(),
              builder: (context) => controller
                      .cartModel!.data!.cartItems.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) => BuildCartsItems(
                          model: controller.cartModel!.data!, index: index),
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.cartModel!.data!.cartItems.length)
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
      persistentFooterButtons: [
        GetBuilder<CartController>(
          builder: (_) {
            return controller.cartModel == null
                ? Container(
                    height: 0,
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultText(
                            text: 'Order Summary',
                            weight: FontWeight.w400,
                            size: 18,
                            color: const Color(0xFF264446)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          defaultText(
                              text: 'Subtotal',
                              weight: FontWeight.w400,
                              size: 18,
                              color: const Color(0xFF264446)),
                          const Spacer(),
                          defaultText(
                              text: controller.cartModel!.data!.subTotal
                                  .toString(),
                              weight: FontWeight.w400,
                              size: 18,
                              color: const Color(0xFFE49E62)),
                        ]),
                        const SizedBox(
                          height: 5,
                        ),
                        defaultText(
                            text: 'Shipping',
                            weight: FontWeight.w400,
                            size: 18,
                            color: const Color(0xFF264446)),
                        const Divider(),
                        Row(
                          children: [
                            defaultText(
                                text: 'Total Payment',
                                weight: FontWeight.w400,
                                size: 18,
                                color: const Color(0xFF264446)),
                            const Spacer(),
                            defaultText(
                                text: controller.cartModel!.data!.total
                                    .toString(),
                                weight: FontWeight.w400,
                                size: 18,
                                color: const Color(0xFFE49E62)),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultButton(
                          onPress: () {},
                          text: 'CheckOut',
                        )
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }
}
