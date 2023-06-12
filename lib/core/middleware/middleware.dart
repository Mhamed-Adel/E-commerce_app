import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/routes/app_routes.dart';
import 'package:test_app/core/services/services.dart';

MyServices myServices = Get.find();
class MyMiddleware extends GetMiddleware{
  @override
  int? get priority => 1;
  
  var token = myServices.sharedPreferences.get('token');

  @override
  RouteSettings? redirect(String? route){
  
  if(myServices.sharedPreferences.get('onBoarding') == true){
    if(token != null) {
      return const RouteSettings(name: AppRoutes.layout);
    }else {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
  return null;
  
  }
}