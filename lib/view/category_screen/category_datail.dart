// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../controller/layout_controller/categories_controller.dart';
// import '../widgets/buildcatitems.dart';

// class CATEGORIESDatailsScreen extends GetView<CategoryController> {
//   const CATEGORIESDatailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
   
//     return GetBuilder<CategoryController>(
//       builder: (c) => Scaffold(
//         appBar: AppBar(),
//         body: ConditionalBuilder(
//           condition: controller.categoryDetailModel != null ,
//           fallback: (context) =>const Center(child:  CircularProgressIndicator()),
//           builder: (context) => SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
                  
//                   Expanded(
//                     flex: 3,
//                     child: GridView.count(
//                         physics: const BouncingScrollPhysics(),
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 2,
//                         mainAxisSpacing: 2,
//                         childAspectRatio: 1 / 1.20,
//                         children: List.generate(
//                             controller
//                                 .categoryDetailModel!.data!.catData.length,
//                             (index) => BuildCatItems(
//                                 model: controller.categoryDetailModel!.data!
//                                     .catData[index]))),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


