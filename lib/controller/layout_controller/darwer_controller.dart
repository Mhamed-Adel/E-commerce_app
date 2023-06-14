// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:test_app/core/crud/crud.dart';
import 'package:test_app/core/functions/check_internet.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/core/shared/network/remote/end_points.dart';
import 'package:test_app/models/login_model.dart';

import '../../core/crud/state_status.dart';
import '../../core/functions/handling_data.dart';

class MyDrawerController extends GetxController{
  @override
  void onInit() {
getUserData ();
    super.onInit();
  }



  StateRequest? stateRequest;
  LoginModel? model;  
  getUserData () async{
  stateRequest =StateRequest.loading;
  update();
  if(await checkInternet()){
    await  Crud.getData(url:AppLink.PROFILE , token: token ).then((value) {
      model =LoginModel.fromJson(value.data);
      stateRequest = handleData(value.data);
      if(model!.status!){
        stateRequest = StateRequest.success;

      }else{
        stateRequest =StateRequest.failure;
      }
    }).catchError((onError){
      print(onError.toString());
      stateRequest =StateRequest.serverException;
    });
  }else{
    stateRequest =StateRequest.internetFaluire;
  }
  update();
  }
 
 
}