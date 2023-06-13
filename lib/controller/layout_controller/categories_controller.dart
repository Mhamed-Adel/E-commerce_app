import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:test_app/core/crud/crud.dart';
import 'package:test_app/core/crud/state_status.dart';
import 'package:test_app/core/functions/handling_data.dart';
import 'package:test_app/core/services/services.dart';
import 'package:test_app/core/shared/network/remote/end_points.dart';
import 'package:test_app/models/cat_datails.dart';


class CategoryController extends GetxController {
@override
void onInit() {
  super.onInit();

  getCatDetails(AppLink.CATEGORIESDETAIL);
}


  MyServices myServices = Get.find();

  late StateRequest stateRequest;
  CategoryDetailModel? categoryDetailModel;  
   
   RxInt currentIndex = 0.obs;

  changeIndex(int index){
  currentIndex.value=index;
  
  }

  getCatDetails(
    String id,
  ) async {
    stateRequest = StateRequest.loading;
    // Get.to(() => const CATEGORIESDatailsScreen());
    update();
     Crud.getData(
        url: AppLink.CATEGORIESDETAIL + id,
        token: myServices.sharedPreferences.getString('token'))
        .then((value) {
      categoryDetailModel = CategoryDetailModel.fromJson(value.data);
      
      stateRequest = handleData(value.data);
      if (StateRequest.success == stateRequest) {
        if (categoryDetailModel!.status!) {
          stateRequest = StateRequest.success;
        } else {
          stateRequest = StateRequest.failure;
        }
      } else {
        stateRequest = StateRequest.serverFaluire;
      }
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
      stateRequest = StateRequest.serverException;
    });
    update();
  }
}
