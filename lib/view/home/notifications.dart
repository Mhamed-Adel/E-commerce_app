import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/test.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/core/shared/components/components.dart';
import 'package:test_app/core/shared/components/constants.dart';

import '../../models/cat_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen( {super.key});
  
  @override
  Widget build(BuildContext context) {
  var controller =  Get.put(TestController());
    return Scaffold(
    appBar: AppBar(
    title: const Text('Notifications'),
    ),
    body: Container(
      padding: const EdgeInsets.all(20),
    child: SingleChildScrollView(
      child: Column(
      children: [
      Row(
      children: [
      Expanded(
        child: Container(
        decoration: const BoxDecoration(
        color: kdefaultColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
        boxShadow: [
                    BoxShadow(
                  color: Colors.black54,
                  blurRadius: 3,
                  offset: Offset(1, 3)
                )
                ],
        ),
        padding: const EdgeInsets.only(top: 12),
        height: 50,
        
        child: defaultText(text: 'News & Update', 
        size: 18,
        color: Colors.white,
        align: TextAlign.center
        ),
        ),
      ),
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
          boxShadow:  [
                    BoxShadow(
                  color: Colors.black54,
                  blurRadius: 3,
                  offset: Offset(1, 3)
                )
                ],
          ),
          padding: const EdgeInsets.only(top: 12),
        height: 50,
        
        child: defaultText(text: 'Draft', 
        size: 18,
        
        align: TextAlign.center
        ),
        ),
      )
      ],
      ),
        Obx(
        () => HandlingDataView(
          
          stateRequest: controller.stateRequest.value,
          widget: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder:(context, index) =>   BuildItems(model: controller.categories[index]), 
            separatorBuilder: (context, index) => const Divider(), 
            itemCount: controller.categories.length,
            shrinkWrap: true,
            ),
          )
        ),
      )
      ],
      ),
    ),
    ),
    );
  }
}

class BuildItems extends GetView<TestController> {
   const BuildItems({super.key,required this.model});
  final Data model;
  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      CachedNetworkImage(imageUrl:model.image.toString() ,
      width: 100,
      height: 100,
      placeholder: (context, url) =>const Center(child:  CircularProgressIndicator()),
      ),
      const SizedBox(width: 10,),
      Text('${model.name}')
    ],
    );
  }
}