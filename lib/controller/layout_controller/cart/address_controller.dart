import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_app/core/functions/handling_data.dart';
import 'package:test_app/core/shared/network/remote/cart_data.dart';
import 'package:test_app/models/add_address_model.dart';

import '../../../core/crud/state_status.dart';
import '../../../core/shared/components/constants.dart';

class OrderController extends GetxController {
  @override
  void onInit() {
    getAddress();
    name = TextEditingController();
    city = TextEditingController();
    region = TextEditingController();
    details = TextEditingController();
    notes = TextEditingController();
    super.onInit();
  }

  late TextEditingController name; 
  late TextEditingController city; 
  late TextEditingController region ;
  late TextEditingController details ;
  late TextEditingController notes; 
  StateRequest stateRequest = StateRequest.none;

  AddressDataModel? addressData;
  Future<void> addAddress() async {
    stateRequest = StateRequest.loading;
    update();
    var response = await GetCartData.addAddress(
      name: name.text,
      city: city.text,
      region: region.text,
      details: details.text,
      notes: notes.text,
    );
    stateRequest = handleData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == true) {
        addressData = AddressDataModel.fromJson(response['data']);
        getAddress();
        // addOrder(addressId: addressData!.id!);
        debugPrint('added address successfully');
        stateRequest = StateRequest.success;
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    update();
  }

  List<AddressDataModel> address = [];

  getAddress() async {
    stateRequest = StateRequest.loading;

    var response = await GetCartData.getAddress(token);
    stateRequest = handleData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == true) {
        for (var item in response['data']['data']) {
          address.add(AddressDataModel.fromJson(item));
        }

        stateRequest = StateRequest.success;
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    update();
  }

  deleteAddress(addressid) async {
    stateRequest = StateRequest.loading;
    update();
    var response = await GetCartData.deleteData(addressid, token);
    stateRequest = handleData(response);
    if (StateRequest.success == stateRequest) {
      if (response['status'] == true) {
        address.removeWhere((element) => element.id! == addressid);
        getAddress();
        Get.rawSnackbar(title: 'Alert', message: 'Deleted successfully');
      } else {
        stateRequest = StateRequest.failure;
      }
    }
    update();
  }

//  addOrder({required int addressId})async{
//     stateRequest = StateRequest.loading;
//     var response = await GetCartData.addOrder(
//       id: addressId,
//     token: token,
//     );
//     stateRequest = handleData(response);
//     if(StateRequest.success == stateRequest){
//       if(response['status']==true){
//       Get.find<CartController>().getCartData();
//         Get.snackbar('Order', 'Add Order Success');
//         stateRequest = StateRequest.success;
//       }else{
//         stateRequest = StateRequest.failure;
//         print('there was an error');
//       }
//     }
//   update();
//   }
}
