import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/controller.dart';
import 'package:test_app/view/carts_screen.dart';
import 'package:test_app/view/drawer/drawer.dart';
import 'package:test_app/core/shared/components/components.dart';
import 'package:test_app/core/shared/components/constants.dart';

class HomeLayout extends StatelessWidget {
  
  


  const HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LayoutControllerImp());
    return GetBuilder<LayoutControllerImp>(
      
      builder: (controller) => Scaffold(
          drawer:  const AppDrawer(),
          appBar: AppBar(
            toolbarHeight: 80,
            
            titleTextStyle: const TextStyle(
            fontFamily: 'Sora',
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            
            ),
            title: controller.titles[controller.currentIndex],
            actions: [
              controller.actions[controller.currentIndex]
            ],
          ),
          body: controller.screens.elementAt(controller.currentIndex),

          extendBody: true,
          floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          focusElevation: 0.0,
            backgroundColor: kdefaultColor,
            onPressed: () {},
            child:  const Icon(IconlyLight.scan),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
              

          //bottomAppBar
          
          bottomNavigationBar: BottomAppBar(
            height: 90,
            
            shape: const CircularNotchedRectangle(),
            notchMargin: 7,

            elevation: 10,
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: defaultMaterialButton(
                    onPress: (){
                      controller.chnagePages(0);
                    }, 
                    icon: controller.currentIndex != 0 ? IconlyLight.home : IconlyBold.home, 
                    isActive: controller.currentIndex == 0 ? true : false, 
                    text: 'Home'),
                ),
                Expanded(
                  child: defaultMaterialButton(
                    onPress: (){
                      controller.chnagePages(1);
                    }, 
                    icon: controller.currentIndex != 1 ? IconlyLight.category : IconlyBold.category, 
                    isActive: controller.currentIndex == 1 ? true : false, 
                    text: 'Categories'),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: defaultMaterialButton(
                    onPress: (){
                      controller.chnagePages(2);
                    }, 
                    icon: controller.currentIndex != 2 ? Icons.favorite_border_sharp :Icons.favorite, 
                    isActive: controller.currentIndex == 2 ? true : false, 
                    text: 'Favorites'),
                ),
                Expanded(
                  child: defaultMaterialButton(
                    onPress: (){
                      // controller.chnagePages(3);
                      Get.to(()=>   const CartScreen());
                    }, 
                    icon: Icons.shopping_cart_outlined, 
                    isActive: controller.currentIndex == 3 ? true : false, 
                    text: 'Cart'),
                ),
              ],
            ),
          )),
    );
  }
}
