import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:test_app/core/shared/components/styles.dart';
import 'package:test_app/view/favorites_screen.dart';
import 'package:test_app/view/home/home_screen.dart';
import 'package:test_app/view/category_screen/category_screen.dart';


abstract class LayoutController extends GetxController{
  chnagePages(int index);

  
}

class LayoutControllerImp extends LayoutController{
  
  int currentIndex = 0;
  
  

  List<Widget> titles = [
    Image.asset(
              
              'assets/images/Logo.png',
            ),
    const Text('Categories'),
    const Text('Favorites'),
    
  ];

  List<Widget> actions= [
    IconButton(
                color: const Color(0xFFFAFCFC),
                onPressed: () {
                ThemeServices().switchTheme();
                },
                icon: const Icon(
                  Icons.dark_mode,
                  color: Colors.black,
                ),
              ),
    IconButton(
                color: const Color(0xFFFAFCFC),
                onPressed: () {},
                icon: const Icon(
                  IconlyLight.category,
                  color: Colors.black,
                ),
              ),
    
              const Icon(
                  IconlyLight.heart,
                  color: Colors.black,
                ),
              
    
  ];


  List<Widget> screens=[
    const HomeScreen(),
    const CategoryScreen(),
    const FavoritesScreen(),
    
  ];
  @override
   chnagePages(int index) {
    currentIndex = index;
    update();
  }
  
 
  
}


//   
//   Widget currentScreen = HomeScreen();
//   void changeBottomNavBar (int index){
//   
  
//   update();
//   }