// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/layout_controller/cart_controller.dart';
import 'package:test_app/controller/layout_controller/favorites_controller.dart';
import 'package:test_app/core/crud/crud.dart';
import 'package:test_app/core/functions/check_internet.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/core/shared/network/remote/end_points.dart';
import 'package:test_app/models/change_fav_model.dart';
import 'package:test_app/models/home_data_model.dart';
import '../../core/crud/state_status.dart';
import '../../core/functions/handling_data.dart';
import '../../models/cat_model.dart';
import '../../models/search_model.dart';

class HomeController extends GetxController {
  var scrollController = ScrollController();
  var searchController = TextEditingController();

  StateRequest stateRequest =StateRequest.none;

  @override
  void onInit() {
    searchController = TextEditingController();
    getHomeData();
    getCategoriesData();
    super.onInit();
  }

  Map favorites = {};
  Map cart = {};
  HomeModel? homeModel;

  getHomeData() async {
    stateRequest = StateRequest.loading;
    update();
    if (await checkInternet()) {
       Crud.getData(url: AppLink.HOME, token: token).then((value) {
        homeModel = HomeModel.fromJson(value.data);
        for (var element in homeModel!.data!.products) {
          favorites.addAll({element.id: element.inFavorites});
        }
        for (var element in homeModel!.data!.products) {
          cart.addAll({element.id: element.inCart});
        }

        stateRequest = handleData(value.data);
        if (StateRequest.success == stateRequest) {
          if (value.statusCode == 200) {
            stateRequest = StateRequest.success;
          } else {
            stateRequest = StateRequest.failure;
          }
        } else {
          stateRequest = StateRequest.serverFaluire;
        }
      }).catchError((error) {
        print(error.toString());
        stateRequest = StateRequest.serverException;
        print('server Exception failure');
      });
    } else {
      stateRequest = StateRequest.internetFaluire;
      print('internet failure');
    }
    update();
  }

  ChangeFavirotesModel? favModel;
  changeFavorites(int productId) async {
    favorites[productId] = !favorites[productId];
     Crud.postData(
        url: AppLink.FAVORITES,
        token: token,
        data: {'product_id': productId}).then((value) {
      favModel = ChangeFavirotesModel.fromJson(value.data);
      if (favModel!.status) {
        stateRequest = StateRequest.success;
        Get.find<FavoritesController>().getFavoritesData();
      } else {
        favorites[productId] = !favorites[productId];
        Get.defaultDialog(title: 'Failed', middleText: 'Failed to get data');
        stateRequest = StateRequest.failure;
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      stateRequest = StateRequest.serverException;
    });
    update();
  }

  CategoriesModel? catModel;

  getCategoriesData() async {
    stateRequest = StateRequest.loading;
    update();
    if (await checkInternet()) {
       Crud.getData(url: AppLink.CATEGORIES).then((value) {
        catModel = CategoriesModel.fromJson(value.data);
        stateRequest = handleData(value.data);
        if (stateRequest == StateRequest.success) {
          if (catModel!.status == true) {
            stateRequest = StateRequest.success;
          } else {
            stateRequest = StateRequest.serverFaluire;
            print('Server Error');
          }
        } else {
          stateRequest = StateRequest.failure;
        }
      }).catchError((error) {
        print(error.toString());
        stateRequest = StateRequest.serverException;
      });
    } else {
      stateRequest = StateRequest.internetFaluire;
    }
    update();
  }

  changeCart(productId) async {
    cart[productId] = !cart[productId];
    
     Crud.postData(
        url: AppLink.CART,
        token: token,
        data: {'product_id': productId}).then((value) {
      favModel = ChangeFavirotesModel.fromJson(value.data);
      if (favModel!.status == true) {
        Get.find<CartController>().getCartData();
        // Get.snackbar('Cart', favModel!.message,);
        stateRequest = StateRequest.success;
      } else {
        stateRequest = StateRequest.failure;
        cart[productId] = !cart[productId];
      }
    }).catchError((onError) {
      stateRequest = StateRequest.serverException;
    });
    update();
  }

  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      stateRequest = StateRequest.none;
      isSearch = false;
    }
    update();
  }
  searchStatus (String text){
    isSearch = true;
    searchProduct(text);
    update();
  }
  SearchModel? searchModel;

  searchProduct(String text)async{
    stateRequest = StateRequest.loading;
    
    Crud.postData(url: AppLink.SEARCH,
  token: token,
   data:{
      'text': text
    }).then((value){
      searchModel = SearchModel.fromJson(value.data);
      stateRequest = handleData(value.data);
      if (stateRequest == StateRequest.success) {
        if (searchModel!.status == true) {
          stateRequest = StateRequest.success;  
        }else{
          stateRequest = StateRequest.serverFaluire;
        }
      }else{
        stateRequest = StateRequest.failure;
      }
    }).catchError((error){
      print(error.toString());
      stateRequest = StateRequest.serverException;
    });
    update();
  }
}
