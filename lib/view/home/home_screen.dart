import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:test_app/controller/layout_controller/home_controller.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/core/shared/components/components.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/view/widgets/home_widgets/build_bunner.dart';
import 'package:test_app/view/widgets/home_widgets/build_products.dart';

import '../widgets/home_widgets/build_categories.dart';
import '../widgets/home_widgets/build_search_products.dart';
import '../widgets/home_widgets/search_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<HomeController>(
      builder: (_) => HandlingDataView(
        stateRequest: controller.stateRequest,
        widget: ConditionalBuilder(
            fallback: (context) => const LinearProgressIndicator(),
            condition:
                controller.homeModel != null && controller.catModel != null,
            builder: (context) {
              return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
// ***************** SEARCH BAR ****************************//

                        const SearchWidget(),
                        controller.isSearch
                            ? Container(
                                margin: const EdgeInsets.only(top: 15),
                                width: double.infinity,
                                height: 600,
                                child: ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        BuildSearchProducts(
                                          product: controller
                                              .searchModel!.data.data[index],
                                        ),
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: controller
                                        .searchModel!.data.data.length),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 26),
                                    child: defaultText(
                                        text: 'Special Offers', size: 16),
                                  ),

//************************   BUNNER  *************************************//

                                  Container(
                                    height: 130,
                                    margin: const EdgeInsets.only(
                                        top: 13, bottom: 13, left: 4),
                                    child: ListView.builder(
                                      controller: controller.scrollController,
                                      itemCount: controller
                                          .homeModel!.data!.banners.length,
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          BuildBunner(
                                              bunner: controller.homeModel!
                                                  .data!.banners[index]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ScrollIndicator(
                                        scrollController:
                                            controller.scrollController,
                                        width: 50,
                                        height: 10,
                                        indicatorWidth: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[300]),
                                        indicatorDecoration: BoxDecoration(
                                            color: kdefaultColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),

// ************************** CATEGORIES *******************************//

                                  Container(
                                    height: 70,
                                    width: double.infinity,
                                    padding: const EdgeInsets.only(left: 5),
                                    child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          BuildCategories(
                                              catModel:
                                                  controller.catModel!.data!,
                                              index: index),
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: controller
                                          .catModel!.data!.data!.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 26),
                                    child: Row(
                                      children: [
                                        defaultText(
                                            text: 'Top Trend', size: 16),
                                        const Spacer(),
                                        defaultTextButton(
                                            text: 'view All',
                                            onPressed: () {},
                                            fontSize: 16,
                                            color: const Color(0XFFF2A666))
                                      ],
                                    ),
                                  ),

// ************************* products ********************************//

                                  Container(
                                    alignment: Alignment.centerLeft,
                                    //  margin: const EdgeInsetsDirectional.only(start: 5),
                                    height: 217,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            BuildProducts(
                                                product: controller.homeModel!
                                                    .data!.products[index]),
                                        itemCount: controller
                                            .homeModel!.data!.products.length),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),

/*   defaultText(text: '     Popular Now', size: 15),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: 294,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 3,
                          offset: Offset(1, 3))
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(left: 5, top: 5),
                        decoration: BoxDecoration(
                            color: const Color(0XFFF2F2F2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assets/images/chair.png',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: defaultText(
                              text: 'Ox Mathis Furniture',
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          defaultText(
                            text: 'Modern Style',
                            size: 15,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          defaultText(
                              text: '230',
                              size: 15,
                              color: const Color(0XFFE49E62)),
                        ],
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(IconBroken.Heart))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )*/
                      ],
                    ),
                  ]);
            }),
      ),
    );
  }
}
