import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/home_controller.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/core/shared/components/components.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/models/poduct_des_model.dart';

import '../../controller/layout_controller/product_controller.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: GetBuilder<ProductController>(builder: (controller) {
                return HandlingDataView(
                  stateRequest: controller.stateRequest,
                  widget:controller.productDataModel != null ? Builder(
                      model: controller.productDataModel!.data!,

                    ) : const LinearProgressIndicator() 
                    
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class Builder extends StatelessWidget {
  const Builder({
    super.key, required this.model,
    
  });

  final Datta model; 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: CachedNetworkImage(
            imageUrl: '${model.image}',
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: defaultText(
                  text: '${model.name}', size: 20),
            ),
            const Spacer(flex: 1),
            Text(
              '${model.price} \$',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            GetBuilder<HomeController>(
              builder:(controller) =>  Icon(
                Icons.shopping_cart,
                size: 30,
                color: controller.cart[model.id]
                    ? kdefaultColor
                    : Colors.grey,
              ),
            ),
            const Text('  2.1 k'),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.remove_red_eye,
              size: 30,
              color: kdefaultColor,
            ),
            const Text('  2.1 k'),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            defaultText(text: 'Rating', size: 20),
            const SizedBox(
              width: 5,
            ),
            RatingBarIndicator(
              itemBuilder: (context, index) =>
                  const Icon(Icons.star_border),
              itemCount: 5,
              itemSize: 25,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        defaultText(text: 'Description', size: 20),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 170,
            child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    '${model.description}',
                    
                  ),
                ])),
        const SizedBox(
          height: 7,
        ),
        GetBuilder<HomeController>(builder: (controller) {
          {
            return !controller.cart[model.id] ? defaultButton(
                onPress: () {
                  controller.changeCart(model.id);
                  
                },
                text: 'add to cart',) : 
                    defaultButton(onPress: (){}, text: 'order now');
          }
        }),
        
      ],
    );
  }
}
