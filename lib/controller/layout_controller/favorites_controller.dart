// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:test_app/core/crud/crud.dart';
import 'package:test_app/core/crud/state_status.dart';
import 'package:test_app/core/functions/check_internet.dart';
import 'package:test_app/core/functions/handling_data.dart';
import 'package:test_app/core/shared/network/remote/end_points.dart';
import 'package:test_app/models/favorites_model.dart';

import '../../core/middleware/middleware.dart';

class FavoritesController extends GetxController {
  @override
  void onInit() {
    getFavoritesData();

    super.onInit();
  }

  var token = myServices.sharedPreferences.getString('token');

  FavoritesModel? favoritesModel;

  StateRequest? stateRequest;
  getFavoritesData() async {
    stateRequest = StateRequest.loading;
    if (await checkInternet()) {
       Crud.getData(url: AppLink.FAVORITES, token: token).then((response) {
        
        stateRequest = handleData(response.data);
        if (StateRequest.success == stateRequest) {
          favoritesModel = FavoritesModel.fromJson(response.data);
          if (favoritesModel!.status == true) {
            stateRequest = StateRequest.success;
          } else {
            stateRequest = StateRequest.serverFaluire;
          }
        } else {
          stateRequest = StateRequest.failure;
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
