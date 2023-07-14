import 'package:get/get.dart';
import 'package:test_app/core/crud/state_status.dart';
import 'package:test_app/models/cat_model.dart';

import '../../core/functions/handling_data.dart';
import '../../core/shared/network/remote/home_data.dart';

class TestController extends GetxController{
   @override
  void onInit() {
    
    getCategoriesData();
   
    super.onInit();
  }
  RxList categories = <Data>[].obs;
  Rx<StateRequest> stateRequest = StateRequest.none.obs;

  HomeData homedata = HomeData();



  getCategoriesData()async{
  
  stateRequest.value = StateRequest.loading;
  var response =await homedata.getData();
  stateRequest.value = handleData(response);
  if(StateRequest.success == stateRequest.value)
  {
    if(response['status'] == true) {
    for (var item in response['data']['data']){
      categories.add(Data.fromJson(item));
    }
  stateRequest.value = StateRequest.success;
  }else{
    stateRequest.value = StateRequest.failure;
  }
  }
  }
}