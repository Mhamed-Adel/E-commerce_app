import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/crud/crud.dart';
import 'package:test_app/core/crud/state_status.dart';
import 'package:test_app/core/functions/check_internet.dart';
import 'package:test_app/core/functions/handling_data.dart';
import 'package:test_app/core/routes/app_routes.dart';
import 'package:test_app/core/shared/network/remote/end_points.dart';
import 'package:test_app/models/login_model.dart';

abstract class SignupController extends GetxController {
  signUP();

  goToLogin();
}

class SignupControllerImp extends SignupController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  // SignupData signupData = SignupData(Get.find());
  StateRequest? stateRequest;

  LoginModel? model;

  @override
  signUP() async {
    stateRequest = StateRequest.loading;
    update();

    if (await checkInternet()) {
       Crud.postData(url: AppLink.SIGNUP, data: {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'phone': phoneController.text
      }).then((value) {
        model = LoginModel.fromJson(value.data);
        stateRequest = handleData(value);
        if (StateRequest.success == stateRequest) {
          if (model!.status == true) {
            stateRequest = StateRequest.success;
            Get.offNamed(AppRoutes.layout);
          } else {
            Get.defaultDialog(
                title: 'Warning',
                middleText: 'Phone Number Or Email Already Exists');
            stateRequest = StateRequest.failure;
          }
        }
      }).catchError((error) {
        if (kDebugMode) {
          print(error.toString());
        }
        stateRequest = StateRequest.serverException;
      });
    } else {
      stateRequest = StateRequest.internetFaluire;
    }

    update();
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
