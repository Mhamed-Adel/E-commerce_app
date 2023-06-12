import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/home_controller.dart';

import '../../../core/shared/components/components.dart';
import '../../../core/shared/components/constants.dart';

class SearchWidget extends GetView<HomeController> {
  const SearchWidget({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 26, right: 5),
      child: Row(
        children: [
          Expanded(
            child: defaultFormField(
              suffix: Icons.search,
              onSubmit: (String text){
                controller.searchStatus(text);
              },
              controller:controller.searchController,
              type: TextInputType.text,
              onChanged: (String text){
                
                controller.checkSearch(text);
              },
              
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'mustnot be empty';
                }
              },
              label: 'Search',
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
                color: kdefaultColor,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                color: Colors.white,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(IconlyLight.filter)),
          )
        ],
      ),
    );
  }
}
