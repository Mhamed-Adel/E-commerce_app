import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/cart/address_controller.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/models/add_address_model.dart';

import 'add_address.dart';

class ViewAddressScreen extends StatelessWidget {
  const ViewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OrderController());
    return Scaffold(
      appBar: AppBar(),
      body: const AddressViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
        Get.to(()=> const OrdersScreen());
      },
      child: const Icon(Icons.add_location),
      ),   
    );
  }
}

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder:(controller) => 
    HandlingDataView(
      stateRequest: controller.stateRequest,
      widget:
       controller.address.isNotEmpty ?
       SizedBox(
         height: MediaQuery.of(context).size.height*1,
         child: ListView.builder(
          itemBuilder: (context, index) =>
           BuildView(model:controller.address[index],controller: controller),
           itemCount: controller.address.length,
           ),
       ) : const Center(child: Text('No address')),
    )
    );
  }
}


class BuildView extends StatelessWidget {
   const BuildView({super.key,required this.model,required this.controller});
final  AddressDataModel model;
final OrderController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title:Text(model.city.toString()),
        subtitle: Text(model.name.toString()),
        trailing: IconButton(onPressed: (){
          controller.deleteAddress(model.id);
        }, icon:const Icon(Icons.delete_outline)),
      ),
    );
  }
}