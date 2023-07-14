import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/core/routes/app_routes.dart';

import '../../controller/layout_controller/cart/address_controller.dart';
import '../../core/shared/components/components.dart';

class OrdersScreen extends GetView<OrderController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                defaultText(text: 'Add Your Address', size: 18),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                  controller: controller.name,
                  type: TextInputType.name,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter a name';
                    }
                  },
                  label: 'name',
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                  controller: controller.city,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter a name';
                    }
                  },
                  label: 'city',
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                  controller: controller.region,
                  type: TextInputType.streetAddress,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter a number';
                    }
                  },
                  label: 'region',
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                  controller: controller.details,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter a number';
                    }
                  },
                  label: 'details',
                ),
                const SizedBox(
                  height: 10,
                ),
                defaultFormField(
                  controller: controller.notes,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'enter a number';
                    }
                  },
                  label: 'notes',
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<OrderController>(
                  builder: (controller) => HandlingDataView(
                    stateRequest: controller.stateRequest,
                    widget: defaultButton(
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          controller.addAddress().then((value) => 
                          Get.offAllNamed(AppRoutes.layout)
                          );
                          
                        }
                      },
                      text: 'Add address',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
