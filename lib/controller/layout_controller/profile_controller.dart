import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/crud/crud.dart';
import 'package:test_app/core/crud/state_status.dart';
import 'package:test_app/core/functions/check_internet.dart';
import 'package:test_app/core/shared/components/constants.dart';
import 'package:test_app/core/shared/network/remote/end_points.dart';
import 'package:test_app/models/login_model.dart';

class ProfileConroller extends GetxController{
  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }
var  nameConroller = TextEditingController();
var  emailConroller = TextEditingController();
var  phoneConroller = TextEditingController();

   StateRequest? stateRequest;
  LoginModel loginModel = LoginModel();
  
  getProfileData() async {
  
  stateRequest = StateRequest.loading;
  update();
  if(await checkInternet()){
    await Crud.getData(url: AppLink.PROFILE,token:token ).then((value) {

      if(value.statusCode == 200){
        loginModel = LoginModel.fromJson(value.data);
        
        stateRequest = StateRequest.success;
      }else{
        stateRequest = StateRequest.serverFaluire;
      }

    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
      }
      stateRequest = StateRequest.serverFaluire;
    });
  }
  else{
    stateRequest = StateRequest.internetFaluire;
  }
  update();
  }
}