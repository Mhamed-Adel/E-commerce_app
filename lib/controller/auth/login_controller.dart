// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/crud/crud.dart';
import 'package:test_app/core/crud/state_status.dart';
import 'package:test_app/core/services/services.dart';
import 'package:test_app/models/login_model.dart';
import 'package:test_app/view/auth_pages/login_page/forgot_pass/forgetpass.dart';
import 'package:test_app/core/shared/network/remote/end_points.dart';
import '../../core/functions/check_internet.dart';
import '../../core/functions/handling_data.dart';
import '../../core/routes/app_routes.dart';

abstract class AppLoginController extends GetxController {
  
  goToSignUp();
  goToForgotPass();
  userLogin();
}

class AppLoginControllerImplemt extends AppLoginController {
  late TextEditingController emailController ;
  late TextEditingController passwordController;

  MyServices myServices = Get.find();

  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  goToForgotPass() {
    Get.to(() => ForgotPassScreen());
  }
  
  
  LoginModel? model;

  StateRequest? stateRequest = StateRequest.none;

  @override
  userLogin() async {
    stateRequest = StateRequest.loading;
    update();
    if (await checkInternet()) {
      await Crud.postData(url: AppLink.LOGIN, data: {
        'email': emailController.text,
        'password': passwordController.text,
      }).then((value) {
        model = LoginModel.fromJson(value.data);
        stateRequest = handleData(value.data);
        print(value.data);
        if (StateRequest.success == stateRequest) {
          if (model!.status == true) {
            stateRequest = StateRequest.success;
            myServices.sharedPreferences
                .setString('token', '${model!.data!.token}')
                .then((value) {
              Get.offAllNamed(AppRoutes.layout);
            });
          } else {
            Get.defaultDialog(
                title: 'Failed', middleText: 'Password Or Email Invalid');
            stateRequest = StateRequest.failure;
          }
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

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    if(kDebugMode){
      emailController.text = "ayak77431@gmail.com";
      passwordController.text = "12345678";
    }
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
