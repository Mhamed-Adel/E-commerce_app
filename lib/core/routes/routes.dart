
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_app/view/layout/home_layout.dart';
import 'package:test_app/view/auth_pages/login_page/login_screen.dart';
import 'package:test_app/view/auth_pages/sign_up/sign_up.dart';
import 'package:test_app/view/home/home_screen.dart';
import 'package:test_app/view/on_boarding/on_boarding_screen.dart';
import 'package:test_app/core/routes/app_routes.dart';
import 'package:test_app/core/middleware/middleware.dart';
List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: ()=> const OnBoardingScreen(),middlewares: [MyMiddleware()]),
  GetPage(name: AppRoutes.login, page: ()=> LoginScreen()),
  GetPage(name: AppRoutes.layout, page: ()=> const HomeLayout()),
  GetPage(name: AppRoutes.homeScreen, page: ()=>  const HomeScreen()),
  GetPage(name: AppRoutes.signup, page: ()=> SignUpScreen()),
];


