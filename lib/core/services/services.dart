import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../crud/crud.dart';

class MyServices extends GetxService {
  
  late SharedPreferences sharedPreferences ; 
  
  Future<MyServices> init() async {
  sharedPreferences =   await SharedPreferences.getInstance() ; 
  Crud.init();
  return this ; 
  
  }

}

initialServices() async  {
  await Get.putAsync(() => MyServices().init()) ; 
}