import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/layout_controller/categories_controller.dart';
import '../widgets/categories/buildcatitems.dart';
import '../widgets/categories/buildcategoriespage.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 1, 
            child: BuildCategoriesPage(),
            ),
          const Expanded(
            flex: 5,
            child: BuildCatItems(),
          ),

          //       GetBuilder<CategoryController>(
          //   builder: (c) => Scaffold(
          //     appBar: AppBar(),
          //     body: ConditionalBuilder(
          //       condition: controller.categoryDetailModel != null ,
          //       fallback: (context) =>const Center(child:  CircularProgressIndicator()),
          //       builder: (context) => SafeArea(
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Column(
          //             children: [

          //               Expanded(

          //                 child: GridView.count(
          //                     physics: const BouncingScrollPhysics(),
          //                     crossAxisCount: 2,
          //                     crossAxisSpacing: 2,
          //                     mainAxisSpacing: 2,
          //                     childAspectRatio: 1 / 1.20,
          //                     children: List.generate(
          //                         controller
          //                             .categoryDetailModel!.data!.catData.length,
          //                         (index) => BuildCatItems(
          //                             model: controller.categoryDetailModel!.data!
          //                                 .catData[index]))),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

/*  Widget builCatItems(Data catModel) => InkWell(
        onTap: () {
          Get.lazyPut(() => CategoryController());
          controller.getCatDetails(catModel.id.toString());
        },
        child: Container(
          alignment: Alignment.centerLeft,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                        blurRadius: 5,
                        offset: Offset(1, 4)
              )
            ]
          ),
          // width: double.infinity,
          

          child: Row(
                    children: [
                      
                      Image(
                        image: NetworkImage('${catModel.image}',
                        ),
                        width: 80,
                        height: 100,
                        fit: BoxFit.contain,

                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: defaultText(text: '${catModel.name}', size: 18)),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  )
          
        ),
      );
*/
}
