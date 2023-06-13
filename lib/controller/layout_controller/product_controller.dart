// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:test_app/core/crud/state_status.dart';
import 'package:test_app/core/functions/handling_data.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/models/poduct_des_model.dart';

import '../../core/crud/crud.dart';
import '../../core/functions/check_internet.dart';
import '../../core/services/services.dart';
import '../../view/home/product_detail.dart';

class ProductController extends GetxController {
  MyServices myServices = Get.find();

  StateRequest stateRequest = StateRequest.none;
   ProductDataModel? productDataModel;
  
  // getProductData(productId) async{
  //   Get.to(() => const ProductScreen());
  //   stateRequest = StateRequest.loading;
  //   update();
  
  // var response = await ProductData.getData(productId);

  // stateRequest = handleData(response);
  // if(StateRequest.success == stateRequest) {
  //   if(response['status'] == true){
  // productDataModel = ProductDataModel.fromJson(response);
  
  // }else{
  // stateRequest = StateRequest.failure;
  // }
  // }
  
  // update();
  
  // }




    getProductData(productId) async {
    
    productDataModel =null;
    Get.to(() => const ProductScreen());
    stateRequest = StateRequest.loading;
    update();
        

    if (await checkInternet()) {
       Crud.getData(
        url: 'products/$productId',
        token: token,
      ).then((response) {
        

        stateRequest = handleData(response);
        if (StateRequest.success == stateRequest) {
          if (response.statusCode == 200) {
            productDataModel = ProductDataModel.fromJson(response.data);
            
          } else {
            stateRequest = StateRequest.serverFaluire;
            print('server faluire');
          }
        } else {
          stateRequest = StateRequest.failure;
          print('failure');
        }
      }).catchError((onError) {
        print(onError.toString());
        stateRequest = StateRequest.serverException;
        print('Server exeption');
      });
    } else {
      stateRequest = StateRequest.internetFaluire;
      print('internet failure');
    }
    update();
  }
}
