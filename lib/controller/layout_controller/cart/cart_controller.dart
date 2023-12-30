// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/models/cart_model.dart';
import '../../../core/crud/crud.dart';
import '../../../core/crud/state_status.dart';
import '../../../core/functions/check_internet.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/shared/network/remote/end_points.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    getCartData();
    
    super.onInit();
  }

StateRequest  stateRequest = StateRequest.none;
List<CartData> cartModel =[];
  getCartData() async {
    stateRequest = StateRequest.loading ;
    
    if (await checkInternet()) {
    await  Crud.getData(
              url: AppLink.CART,
              token: token)
          .then((response) {
        stateRequest = handleData(response);
        if (StateRequest.success == stateRequest) {
        
          if (response.data['status'] == true && response.data != null) {
              for (var item in response.data["cart_items"]) {
  cartModel.add(CartData.fromJson(item));
}
            print('get carts successfully');
            stateRequest = StateRequest.success ;
          } else {
            stateRequest = StateRequest.serverFaluire ;
          }
        } else {
          stateRequest = StateRequest.failure ;
        }
      }).catchError((onError) {
        print(onError.toString());
        stateRequest = StateRequest.serverException ;
        print('Server exeption');
      });
    } else {
      stateRequest = StateRequest.internetFaluire ;
      print('internet failure');
    }
    update();
  }
  
  

  int _quantity = 1;

  void plusQuantity(CartData model, index) {
    _quantity = model.cartItems[index].quantity!;
    _quantity++;
    
    
  }

  void minusQuantity(CartData model, index) {
    _quantity = model.cartItems[index].quantity!;
    if (_quantity > 1) {
      _quantity--;
    }
    
  }
int  get quantity => _quantity;

  updateCart(String id, int quantity) async {
    
   await  Crud.putData(
        url: AppLink.UPDATECARTS + id,
        token: myServices.sharedPreferences.getString('token').toString(),
        data: {'quantity': quantity}).then((response) {
      stateRequest = handleData(response);
      if (StateRequest.success == stateRequest) {
        print('Success cart updated');
        getCartData();
        stateRequest = StateRequest.success ;
      } else {
        stateRequest = StateRequest.failure ;
      }
    }).catchError((onError) {
      print(onError.toString());
      stateRequest = StateRequest.serverException ;
    });
    update();
  }
  
  
  
  
}
