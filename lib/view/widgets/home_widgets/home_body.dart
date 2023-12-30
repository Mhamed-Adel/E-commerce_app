import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_app/controller/layout_controller/home_controller.dart';
import 'package:test_app/core/functions/handle_dataview.dart';
import 'package:test_app/core/shared/components/components.dart';
import 'package:test_app/view/widgets/home_widgets/build_products.dart';
import 'package:test_app/view/widgets/home_widgets/categories_widget.dart';
import 'package:test_app/view/widgets/home_widgets/indicator.dart';
import 'package:test_app/view/widgets/home_widgets/search_body.dart';
import 'package:test_app/view/widgets/home_widgets/search_widget.dart';

import 'bunner_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => HandlingDataView(
        stateRequest: controller.stateRequest,
        widget: ConditionalBuilder(
            fallback: (context) => const LinearProgressIndicator(),
            condition:
                controller.homeModel != null && controller.catModel != null,
            builder: (context) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                // ***************** SEARCH BAR ****************************//
                
                    const SearchWidget(),
                    controller.isSearch
                        ? BuildSearchItems(controller: controller,)
                        : const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 26),
                                child: defaultText(
                                    text: 'Special Offers', size: 16),
                              ),
                ///************************   BUNNER  *********************************///
                              BunnerWidget(controller: controller,),
                              const SizedBox(
                                height: 5,
                              ),
                               IndicatorWidget(controller: controller),
                
                // ************************** CATEGORIES *******************************//
                
                               CategoriesWidget(controller: controller),
                              
                
                // ************************* products ********************************//
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 26),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    defaultText(
                                        text: 'Top Trend', size: 16),
                                    
                                    defaultTextButton(
                                        text: 'view All',
                                        onPressed: () {},
                                        fontSize: 16,
                                        color: const Color(0XFFF2A666))
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                //  margin: const EdgeInsetsDirectional.only(start: 5),
                                height: 217,
                                child: ListView.builder(
                                    
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
              );
            }),
      ),
    );
  }
}
