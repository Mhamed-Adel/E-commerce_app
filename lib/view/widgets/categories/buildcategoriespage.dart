import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/layout_controller/categories_controller.dart';
import '../../../controller/layout_controller/home_controller.dart';
import '../../../core/functions/handle_dataview.dart';
import '../../../core/shared/components/components.dart';
import '../../../models/cat_model.dart';
import '../../category_screen/category_datail.dart';




class BuildCategoriesPage extends StatelessWidget {

  BuildCategoriesPage({Key? key,})
      : super(key: key);
  final catController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
   return  GetBuilder<HomeController>(
            builder: (controller) => HandlingDataView(
              stateRequest: controller.stateRequest,
              widget: ConditionalBuilder(
                condition: controller.catModel != null,
                fallback: (context) => const Center(child:LinearProgressIndicator()),
                builder: (context) => Expanded(
                  child: ListView.separated(
                    
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          builCatItems(controller.catModel!.data!,
                          index
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10,),
                      itemCount: controller.catModel!.data!.data!.length),
                ),
              ),
            ),
          );
    

  } 
  Widget builCatItems(CatData catModel,index)=>
        Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: ()  {
         catController.getCatDetails(catModel.data![index].id.toString()).then((_) => 
        Get.to(() => CATEGORIESDatailsScreen(categoryname : catModel.data![index].name! ))
        );
            
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            margin: const EdgeInsets.only(
              left: 20,
              top: 5,
            ),
            decoration: BoxDecoration(
              color:   Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 5,
                  offset: Offset(1, 4),
                )
              ],
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: '${catModel.data![index].image}',
                  width: 20,
                  height: 20,
                  
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error, size: 15)),
                ),
                const SizedBox(
                  width: 5,
                ),
                defaultText(
                  text: '${catModel.data![index].name}',
                  size: 13,
                  
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      )
    ;
  
}